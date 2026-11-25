Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91D0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HqC9QuII;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnbISpxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7Ofy+nGZGG5GjSQ/p9hjatkioBWd7QndibG1/NjdTig=; b=HqC9QuIIXwouWX
	0DPOBoNHC6CLqZ0B/OV1YWnBb9QiiTw2+i2IzrxT5oDJoT1T45RSZlWZBXY285vHJVHAiaN37VZpx
	CXIOQx+8XWeidzk5PdgxTAUWHC5jWoEOurUFbOq+8BDA8tQF3/hCMJwqHxG0yaofnq1+qBT7hSKZf
	o0VmpxpA4hHAdpFWwAeMnUEnejnZeFrNBT9SzsGqabVyj2vPWxP4plRRz9r5b5f9BuCtUPNPVmxjz
	122tqlmrS+wB4WFzMUFl2OBYhE1bOeBAOZlb3hCFAj7hNK5GSQZypYhFHFhXBR19jagc97KFWgbIt
	cwGyDF1neO2LI2cKrDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG88-0000000Accs-2emH;
	Wed, 25 Nov 2026 16:46:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG86-0000000AccI-3dQP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:45:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E027401D7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7411F000D3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625158;
	bh=7Ofy+nGZGG5GjSQ/p9hjatkioBWd7QndibG1/NjdTig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FnbISpxnsBf8m0U3xd/OLVl7vxIJAa+9YONUmKpGpEnWKMf08r9xzEpHz/jgp+Wy3
	 hYR8DcSI4C7QgnHZRVTeRA9aG7YpFTOQgXH1pXIwyOSyFwFK5C767S+VcEkIW08ND0
	 47idpSLK+NeC5zqL5mCSMA7g14tj2hVsBJfvpe1ltsneuxkdau490DpgLtvhx013XE
	 kDhjEtwauDJ/g0dIqATs0tWCLtpR9E1aj1ZNY7PA0IRgazQTx/XDU4o7GDyyC3KGuq
	 um/ULeytSQIBUQwk/zXNaYoYOZde63xfl2rgQuHFI6SBJTnyoUMa/R6dphUCShnUWs
	 nTnEf1w8hLE0A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so5513897e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 08:45:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEetfB7URderGN/FTyW/Sss+UYJxyZHbYOP/QdOeuCyvYzu4sWxQypZgfzZVi/GCpcM+BkI/Fkb2/yQ0Vk3CwFq@lists.infradead.org
X-Gm-Message-State: APuU4Z8z3ibm+/4WFwuuS7XzvN5lGvTxiX96BKX7kS0WB4JMQTHD56YV
	JQVQbGLXLOSkdmR5ES9wyxFqrEf+dSKAonQ57dept15E42rSY63qNumzgTKTnUdlbvDAuCsrA8+
	DacWJtqayxWSbPuxamxCIBwGluBytsSE=
X-Received: by 2002:a05:6512:401c:b0:5c1:ad4b:4be7 with SMTP id
 2adb3069b0e04-5c1bc7d00aamr5425949e87.20.1795625156701; Wed, 25 Nov 2026
 08:45:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1795194329.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <cover.1795194329.git.maciej.wieczor-retman@intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 17:45:42 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hUQBr0k3GNqf2t118nRZnBS_Chw4NJXA+j501Bf=AEGQ@mail.gmail.com>
X-Gm-Features: Aa3M54qST7obZ3zrfYaLQiJELeljnYeJDcQKh7-DXwYZlMnrrNHk2B9oFBxFD3s
Message-ID: <CAJZ5v0hUQBr0k3GNqf2t118nRZnBS_Chw4NJXA+j501Bf=AEGQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/42] ACPICA: ACPICA 20260930 with follow-up fixes
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: catalin.marinas@arm.com, pawel.chmielewski@intel.com, 
	kyle.d.pelton@intel.com, lenb@kernel.org, guohanjun@huawei.com, 
	maobibo@loongson.cn, lpieralisi@kernel.org, will@kernel.org, 
	sudeep.holla@kernel.org, erik.kaneda@intel.com, rafael@kernel.org, 
	robert.moore@intel.com, void0red@gmail.com, superm1@kernel.org, 
	chenhuacai@kernel.org, acpica-devel@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 6:18=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> The following patches are ported from upstream ACPICA and contain the 202=
60930
> release and some follow up fixes (so generally everything after the 20260=
408
> release). Only source files relevant to the Linux kernel are being ported=
.
>
> Changes since v1:
> v1 [1] contained only commits between the 20260408 and 20260930 releases.
> However sashiko.dev [2] raised some issues that needed to be either appli=
ed or
> rejected. Most issues were valid and were resolved in patches that follow=
 the
> 20260930 release. Things that were rejected were the whole patch [3] due =
to not
> being a full solution to a very unlikely, debug only problem. Also the sa=
shiko
> comment related to ACPI_GPE_AUTO_ENABLED in patch [4] wasn't applied due =
to
> not being realistically possible to happen and consequences were only an =
odd
> looking log entry.
>
> There are non-ACPICA changes related to constants/variable name changes
> in these patches:
> - ACPICA: actbl2: MPAM: adapt to MPAM ACPI spec v3.1
> - ACPICA: acpica: Fix typo in the IOVT_IOMMU table definitions
>
> The base for this patches is upstream kernel v7.4-rc3 and it consists of
> the following material:
>
> Andre Przywara (1):
>       ACPICA: actbl2: MPAM: adapt to MPAM ACPI spec v3.1
>
> Colin Ian King (2):
>       ACPICA: components: Fix typo "Supress" -> "Suppress"
>       ACPICA: components: Fix typo: "numer" -> "number"
>
> Dave Jiang (2):
>       ACPICA: CEDT: RDPAS: Add missing reserved field in RDPAS structure
>       ACPICA: CEDT: RDPAS: Fix incorrect field positions for RDPAS
>
> Hanjun Guo (1):
>       ACPICA: add UBRT (UnifiedBus Root Table) definitions
>
> Himanshu Chauhan (1):
>       ACPICA: Introduce a new HEST notification type for RISC-V SSE event=
s
>
> Iurii Trukhin (1):
>       ACPICA: parser: Fix parse tree memory leak on AML execution error u=
nwind
>
> Leonard Lausen (1):
>       ACPICA: Executer: Resolve package index references used as integer =
operands
>
> Maciej Strozek (1):
>       ACPICA: Utilities: Fix for AcpiUtVerifyChecksum warning display
>
> Maciej Wieczor-Retman (17):
>       ACPICA: executer: Fix NULL pointer dereference in AcpiExStoreObject=
ToIndex()
>       ACPICA: compiler: Add _Ixx GPE object
>       ACPICA: namespace: Fix possible underflow and NULL pointer derefere=
nce
>       ACPICA: iASL: Fix the truncated count of external control methods
>       ACPICA: release: Update version to 20260930
>       ACPICA: events: Add missing event mutex to AcpiEvClearGpeDispatchBy=
Owner()
>       ACPICA: events: Remove redundant code
>       ACPICA: events: Fix AcpiEvClearGpeDispatchByOwner handler type proc=
essing
>       ACPICA: events: Fix GPE cleanup return after changing program state
>       ACPICA: events: Handle GPEs' Notify dispatch type
>       ACPICA: tables: Fix wrong table unload and notify call order
>       ACPICA: tables: Fix global table read missing mutex
>       ACPICA: executer: Fix copying PCC source buffer data
>       ACPICA: dispatcher: Fix zero size non-NULL PCC buffer pointer
>       ACPICA: utilities: Clear NextObject so the outer loop doesn't read =
it
>       ACPICA: namespace: Fix memory leak around compiler alias flag
>       ACPICA: acpica: Fix typo in the IOVT_IOMMU table definitions
>
> Mario Limonciello (AMD) (1):
>       ACPICA: Add ACPI_MSG_DEBUG to set KERN_DEBUG for debug output
>
> Pawel Chmielewski (3):
>       ACPICA: ACPI 6.5 Add support for the MISC table
>       ACPICA: iASL: Complete KEYP support
>       ACPICA: tables: Fix table buffer leak when Load fails verification
>
> Rong Zhang (1):
>       ACPICA: parser: Set AML length for bytelist
>
> Vidya Sagar (1):
>       ACPICA: IORT: Add Root Complex PASID Flags field
>
> ikaros (8):
>       ACPICA: Events: Clear GPE dispatch by owner during table unload
>       ACPICA: executer: Add bounds checking for PCC field read access
>       ACPICA: Validate 4-char field names before namespace lookup
>       ACPICA: Improve error handling in table loading process
>       ACPICA: executer: Add bounds checking for PCC field write access
>       ACPICA: tables: Fix heap-buffer-overflow in AcpiTbFindTable
>       ACPICA: Fix object reference update to skip non-local notify types
>       ACPICA: namespace: Recognize alias node types in detach
>
> purofle (1):
>       ACPICA: fix: build error with gcc 16: unused-but-set-variable
>
> [1] https://lore.kernel.org/all/20261020141051.2194123-1-pawel.chmielewsk=
i@intel.com/
> [2] https://sashiko.dev/#/patchset/20261020141051.2194123-1-pawel.chmiele=
wski%40intel.com
> [3] https://sashiko.dev/#/message/20261020141051.2194123-9-pawel.chmielew=
ski%40intel.com
> [4] https://sashiko.dev/#/patchset/20261020141051.2194123-1-pawel.chmiele=
wski%40intel.com?part=3D7
>
> Andre Przywara (1):
>   ACPICA: actbl2: MPAM: adapt to MPAM ACPI spec v3.1
>
> Colin Ian King (2):
>   ACPICA: components: Fix typo "Supress" -> "Suppress"
>   ACPICA: components: Fix typo: "numer" -> "number"
>
> Dave Jiang (2):
>   ACPICA: CEDT: RDPAS: Add missing reserved field in RDPAS structure
>   ACPICA: CEDT: RDPAS: Fix incorrect field positions for RDPAS
>
> Hanjun Guo (1):
>   ACPICA: add UBRT (UnifiedBus Root Table) definitions
>
> Himanshu Chauhan (1):
>   ACPICA: Introduce a new HEST notification type for RISC-V SSE events
>
> Iurii Trukhin (1):
>   ACPICA: parser: Fix parse tree memory leak on AML execution error
>     unwind
>
> Leonard Lausen (1):
>   ACPICA: Executer: Resolve package index references used as integer
>     operands
>
> Maciej Strozek (1):
>   ACPICA: Utilities: Fix for AcpiUtVerifyChecksum warning display
>
> Maciej Wieczor-Retman (17):
>   ACPICA: executer: Fix NULL pointer dereference in
>     AcpiExStoreObjectToIndex()
>   ACPICA: compiler: Add _Ixx GPE object
>   ACPICA: namespace: Fix possible underflow and NULL pointer dereference
>   ACPICA: iASL: Fix the truncated count of external control methods
>   ACPICA: release: Update version to 20260930
>   ACPICA: events: Add missing event mutex to
>     AcpiEvClearGpeDispatchByOwner()
>   ACPICA: events: Remove redundant code
>   ACPICA: events: Fix AcpiEvClearGpeDispatchByOwner handler type
>     processing
>   ACPICA: events: Fix GPE cleanup return after changing program state
>   ACPICA: events: Handle GPEs' Notify dispatch type
>   ACPICA: tables: Fix wrong table unload and notify call order
>   ACPICA: tables: Fix global table read missing mutex
>   ACPICA: executer: Fix copying PCC source buffer data
>   ACPICA: dispatcher: Fix zero size non-NULL PCC buffer pointer
>   ACPICA: utilities: Clear NextObject so the outer loop doesn't read it
>   ACPICA: namespace: Fix memory leak around compiler alias flag
>   ACPICA: acpica: Fix typo in the IOVT_IOMMU table definitions
>
> Mario Limonciello (AMD) (1):
>   ACPICA: Add ACPI_MSG_DEBUG to set KERN_DEBUG for debug output
>
> Pawel Chmielewski (3):
>   ACPICA: ACPI 6.5 Add support for the MISC table
>   ACPICA: iASL: Complete KEYP support
>   ACPICA: tables: Fix table buffer leak when Load fails verification
>
> Rong Zhang (1):
>   ACPICA: parser: Set AML length for bytelist
>
> Vidya Sagar (1):
>   ACPICA: IORT: Add Root Complex PASID Flags field
>
> ikaros (8):
>   ACPICA: Events: Clear GPE dispatch by owner during table unload
>   ACPICA: executer: Add bounds checking for PCC field read access
>   ACPICA: Validate 4-char field names before namespace lookup
>   ACPICA: Improve error handling in table loading process
>   ACPICA: executer: Add bounds checking for PCC field write access
>   ACPICA: tables: Fix heap-buffer-overflow in AcpiTbFindTable
>   ACPICA: Fix object reference update to skip non-local notify types
>   ACPICA: namespace: Recognize alias node types in detach
>
> purofle (1):
>   ACPICA: fix: build error with gcc 16: unused-but-set-variable
>
>  drivers/acpi/acpica/acevents.h  |   4 +
>  drivers/acpi/acpica/acglobal.h  |   2 +-
>  drivers/acpi/acpica/acpredef.h  |   1 +
>  drivers/acpi/acpica/acutils.h   |   3 +
>  drivers/acpi/acpica/dsfield.c   |  24 +++
>  drivers/acpi/acpica/evgpe.c     | 355 ++++++++++++++++++++++++++++++++
>  drivers/acpi/acpica/exconfig.c  |   3 +-
>  drivers/acpi/acpica/exconvrt.c  |   4 +-
>  drivers/acpi/acpica/exfield.c   | 105 +++++++---
>  drivers/acpi/acpica/exresop.c   |  26 +++
>  drivers/acpi/acpica/exstore.c   |  20 +-
>  drivers/acpi/acpica/extrace.c   |   2 +-
>  drivers/acpi/acpica/nsaccess.c  |   2 +-
>  drivers/acpi/acpica/nsobject.c  |   7 +-
>  drivers/acpi/acpica/nsxfname.c  |   8 +
>  drivers/acpi/acpica/psargs.c    |   8 +-
>  drivers/acpi/acpica/psloop.c    |   5 +-
>  drivers/acpi/acpica/psobject.c  |   1 -
>  drivers/acpi/acpica/psparse.c   |  16 +-
>  drivers/acpi/acpica/tbdata.c    |  32 ++-
>  drivers/acpi/acpica/tbfind.c    |  16 +-
>  drivers/acpi/acpica/utcksum.c   |   3 +-
>  drivers/acpi/acpica/utdebug.c   |   9 +-
>  drivers/acpi/acpica/utdelete.c  |   5 +
>  drivers/acpi/arm64/mpam.c       |   6 +-
>  drivers/acpi/loongarch/iovt.c   |   6 +-
>  include/acpi/acpixf.h           |   2 +-
>  include/acpi/actbl1.h           |   6 +-
>  include/acpi/actbl2.h           | 200 +++++++++++++++++-
>  include/acpi/platform/aclinux.h |   1 +
>  30 files changed, 811 insertions(+), 71 deletions(-)
>
> --

Whole series applied as 7.5 material, thanks!

