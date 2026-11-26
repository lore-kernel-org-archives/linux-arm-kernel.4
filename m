Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37161606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aohMBjkT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AB4BGLeP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TP//3Tk37aCthCQTZ/xunNEX49UuOPZj/NRDLFDF0zU=; b=aohMBjkTy+6ZXp
	Du4bSMA1ItKsnojMVFHd/jyDVodwuHL8ZPOFZ7UDX2jEgLnU210P0BshyQr7ohcZbE9AWxIMA0Q3t
	u+6bBqdn8HW9TFQO5ulXcG1uMjrrVnBifD5mkZQYOsEjACn1BiXngqdl1OCBEA6GeGWxxiUpVKpsK
	84lYsqAAQ1PXnhPejPj4o5CKjQXND2vMMhPcsnvQ9LuWPBuz4LkaOLeCYMqMf5c8HFp5td56iCDki
	kKlbz10ArOO7UqoVgeoqgSN0mqpYZfjHK5KTZ+9R9/pPXDZFCTmnX9iWv67djfEXblfiPJdsDzM2n
	wS9rr6NN4kZLdaiMSMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY01-0000000D48H-2Y7R;
	Thu, 26 Nov 2026 11:50:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzt-0000000D42b-1VA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56D901D13;
	Thu, 26 Nov 2026 03:50:37 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5A033F632;
	Thu, 26 Nov 2026 03:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693840; bh=Njex7zeOIT87pZjpvIb3q8+UKkGvQ82hdE93b1RTdGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AB4BGLePTMcmpAsoNOZGx/srsZ0881KVumLYg2lkQYWz48tgYOIUEkbchNMIi+whV
	 uUiYmB34fMgdwLhsU9Svtl/Jqvvhjg0AjmWEaEosXzeHa9SFSW5eFgAO3lRnP3tbOH
	 rHRWtBGym9z78C2L+nmaoI8VX5k2j5/qpqJw6N30=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC v2 09/13] efi/arm: Check return value of init_new_context()
Date: Thu, 26 Nov 2026 11:49:32 +0000
Message-ID: <20261126114936.864256-10-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035045_046135_BE517057 
X-CRM114-Status: UNSURE (   9.72  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_new_context() will soon be able to return an error. Check for
errors before continuing.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 drivers/firmware/efi/arm-runtime.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 3167cab62014..054a110986c5 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -55,7 +55,8 @@ static bool __init efi_virtmap_init(void)
 
 	efi_mm.pgd = pgd_alloc(&efi_mm);
 	mm_init_cpumask(&efi_mm);
-	init_new_context(NULL, &efi_mm);
+	if (WARN_ON(init_new_context(NULL, &efi_mm)))
+		return false;
 
 	for_each_efi_memory_desc(md) {
 		phys_addr_t phys = md->phys_addr;
-- 
2.43.0


