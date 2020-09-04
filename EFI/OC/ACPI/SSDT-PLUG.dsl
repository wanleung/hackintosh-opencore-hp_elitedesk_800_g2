/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (32-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of D:/EFI/OC/ACPI/SSDT-PLUG.aml, Sat Sep  5 02:12:03 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000073 (115)
 *     Revision         0x02
 *     Checksum         0x6F
 *     OEM ID           "CORP"
 *     OEM Table ID     "CpuPlug"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200528 (538969384)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "CpuPlug", 0x00003000)
{
    External (_PR_.CPU0, ProcessorObj)

    Method (PMPM, 4, NotSerialized)
    {
        If ((Arg2 == Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                             // .
            })
        }

        Return (Package (0x02)
        {
            "plugin-type", 
            One
        })
    }

    Scope (\_PR.CPU0)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Return (PMPM (Arg0, Arg1, Arg2, Arg3))
        }
    }
}

