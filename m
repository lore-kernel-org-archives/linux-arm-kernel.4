Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2eEf8s9Y;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Yg3r4HXa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UbxRM54/x3gsaWN6jkFOgoIZhRMewegV72A+3q3F3mc=; b=2eEf8s9YRC2Cvy
	ApPxURvs/v+OYzOGMiO2VoMCbnOUy5mGNt10CtvN8Y6LoayqYGb88hTrvXH2LeNfut+Awl04yK1gQ
	6kMwPXLvdUAL5/RNQZ2+Dcjst6VGuOk9vI1RTlUj7oaDcmN6ZncKX55aFQXMf6CpNqScksrrz+TyG
	aaPNuLcQE83oY1YuirD2YPxj8X36xHwYQlaNKrs2w81KBXVymY7Ck5DyKDyydiS8EEeCuUd/LrZL0
	7F21cSLx9g1glORPIIC2/p6YxiXqCUt0rRI//HfrzrGKWPr5eRZbDrR3FheK7VHlddnvPXl0k+R81
	KlgALRDLErDN0YYEpAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxY-0000000Gq7b-1LP1;
	Fri, 27 Nov 2026 15:34:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxx2-0000000GpvD-2R7F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:33:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E2DE1E4D;
	Fri, 27 Nov 2026 07:33:25 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEB413F632;
	Fri, 27 Nov 2026 07:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793607; bh=ZYYAWoxKreiy1oLbAXptBMHxGm45wgu9yoV+MxOg3ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yg3r4HXagVrv3zl20I12s8HoFBmHuH72UcKqi9rQuzUlpUciR7eDUV37XMbjpwrkj
	 Pc7MewOHm6Z8N6/9OGvMDhLazIxhcNZh25RZcBDsP4UWUrZDTwJHEvRrxF0Pd9VM7i
	 OtwrHGIegGCxZkSYGCBkkdTYvQ9xm+zuWxwoI7TU=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:32:59 +0000
Subject: [PATCH RFC v3 4/8] acpi: add CCtype value macros for CCEL table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm_cca_mr-v3-4-df3230afce8f@arm.com>
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
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=ZYYAWoxKreiy1oLbAXptBMHxGm45wgu9yoV+MxOg3ow=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaK0gZOUA742VqK9FJfMhVcJaXrr7xKAygARy
 x13Y7F9iu2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmitAAKCRBt1cPRWsUx
 M8wnC/9VJBXCWG+gOzZuz2ss/tFA4X+la5ksWYTxTfHm5ve+cobHAcb1Zo4GemS5btOdabBxcoh
 7QbP+39jdw5hj/IOMwOflVHAV+XaW2QWkEcK4chkBa90FX/oZv6/BrrgGLemi+hUkRjJxSP9KeA
 5zkHNhTIKPjfCqBBwxIBELeW1sMIHqnh5Z8GBTmLLfX6al+BB4w4I97bypqyRuW/4fWZFggzjmz
 NXeNVNr5hmDvVmjTjDfaV3gL/HOtFnUQxXI/VJ71SX7Lp+mYkU9MornF3dqbr0CsaCw918OS6Yn
 zoPv4TDe1n+71g/AIG8I2mkkarcnDFhw2FgZZEU1BCpPWa9HVV1xC33GpOENp2Yn9gQYO6PJ0Aj
 QSMYvXWMZHfHMIQw7+cG4dAllTMdTI1ESVGVNOHEvceR7l9fsMoJRc41UF0e5pOL5QzF+SFQBHH
 CifCMNmWDPNlmDBCOV2n6MeHoH0qt5GjF3EM4faTMg1rjcvy0yVkCfoHYf2p6umzUlpfc=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073328_690845_93A1D968 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CCtype value macros for CCEL table.

Link: [0] https://github.com/tianocore/edk2/issues/11384
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/acpi/actbl2.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 76e4a5bc79b42..44810b9b9ddc5 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -454,6 +454,13 @@ struct acpi_table_ccel {
 	u64 log_area_start_address;
 };
 
+/* Values for CCtype */
+#define ACPI_CCEL_CCTYPE_RESERVED	0
+#define ACPI_CCEL_CCTYPE_AMD_SEV	1
+#define ACPI_CCEL_CCTYPE_INTEL_TDX	2
+#define ACPI_CCEL_CCTYPE_RISCV_AP_TEE	3
+#define ACPI_CCEL_CCTYPE_ARM_CCA	4
+
 /*******************************************************************************
  *
  * ERDT - Enhanced Resource Director Technology (ERDT) table

-- 
2.43.0


