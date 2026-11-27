Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58B6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fCF3U40Z;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rSJCPZmA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oRtgKudCp/VASC+XZuTjAPaIg7QOvB2qmO6nzhhb1yI=; b=fCF3U40Z1gElmL
	MJxwQ9y8Cl0z6mCCD2oSR4S56YciLVZluOFEUG2qHQYsd1hUG4eIGXPIIwyoYKwRSRscBrVYMW5Ji
	HUXjm2QNcPN7QAlaVyNC0K1EkDwAC5KvNxlfjF5c+QzWRixU0DArenKdXhB8JejEM/BnUjL8ZsvbL
	WvTVuoisEHt7j2q8wGdjVktuvml6mgjOXR4oT4OQkq69seb38JOR9wuWi3Ta0cImgSQVKicuhYvx3
	e5ej0+Rf4fEq0iW68H5vOgXc9y27BebWmWlM+S6+tEvYYYDnf+qrgp9TaYUHyycZDe1AVDWRbjcol
	nTxtSwf3EB2ixb71YOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxX-0000000Gq6O-2TOo;
	Fri, 27 Nov 2026 15:33:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxwz-0000000GpuF-2kEa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:33:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB4421D70;
	Fri, 27 Nov 2026 07:33:21 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 366003F632;
	Fri, 27 Nov 2026 07:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793604; bh=LRigvAJhp+2eLJBX6kefUPGIgYbEzkL9gINj2qEXMik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rSJCPZmAVLAT6McHtVMqDDZNAWlk36c1D4BkzXv1OrFuevUAlQbVlJbPEGWUFYlOl
	 c9a4RVnb0n7aYlcqSYAcLpWU4HHrKS9XbUSynUtZ7erovk9Jf6qZD4jPYetKZh29LK
	 IFrx2faozQTDi9MlxebS7vlc+alv5cDBsOcRTGCw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:32:58 +0000
Subject: [PATCH RFC v3 3/8] arm64: acpi: Enable ACPI CCEL support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm_cca_mr-v3-3-df3230afce8f@arm.com>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
In-Reply-To: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
 Pawel Chmielewski <pawel.chmielewski@intel.com>, 
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Gavin Shan <gshan@redhat.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=Y0OSdCtnotPMPPdxEFeJ/K5QTuVjcFwxETs3OgoHwHU=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaK0QrrxLQz97qermy0wQEP8E7gn26M5bOINn
 UgzQQ/WVl+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmitAAKCRBt1cPRWsUx
 M4f9C/9nSjXn69EzPPM8K6RQUBfOMIwloMkG7YJrYryOPA6cDfPFdBXQ25/PEFaQcSup+8bb4Nw
 4+x4uL3xbUC8AhRWTOxCg1GjmcS27c7YHiOvPGoZsOodsBVKKPMWyfeAzKFeH4u9eEv+AzFggCw
 sRseP1c+bM7A+H/wuCkVXVZ5UG9bM0llrALZ6UQjHVHcEijB/L/wxiDPuJkf1rvvbgXg0nMPGhK
 /qEoZaLWBqgfULONIvsSKj0ODieQS32ZZ9fQkqRvw+7QoqGkvopVcXWm9ry+jNkn7D6PI0smsRC
 s35Arw0UiAVaKXOU0zvobWotKX3HuXCwA8p1w+BxpPJ2pXuIMXVqhGvgq5UMUuqZeL9Tp3BZ7hT
 93bgAIGg5e02FL0/gKMZHUqTSLdi836xgQwUq4NP7uJSH8bnIP1VxwdPfkkbZ26VpI4HXO5XiMm
 eurk7irjMBevkbZfjQd732DS+10uukqYTpUAHqnDsE6LxpzOeLPIzQKOWTmAX9gwiwxFA=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073325_811160_1BEC4D8A 
X-CRM114-Status: GOOD (  11.20  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
As per UEFI specifications NVS memory is reserved for Firmware use even
after exiting boot services. Thus map the region as read-only.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kernel/acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 681aa2bbc3995..3d6335db882d3 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -354,6 +354,17 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 			prot = PAGE_KERNEL_RO;
 			break;
 
+		case EFI_ACPI_MEMORY_NVS:
+			/*
+			 * ACPI NVS marks an area reserved for use by the
+			 * firmware, even after exiting the boot service.
+			 * This may be used by the firmware for sharing dynamic
+			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
+			 * as read-only.
+			 */
+			prot = PAGE_KERNEL_RO;
+			break;
+
 		case EFI_ACPI_RECLAIM_MEMORY:
 			/*
 			 * ACPI reclaim memory is used to pass firmware tables

-- 
2.43.0


