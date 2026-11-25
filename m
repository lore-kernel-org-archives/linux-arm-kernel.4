Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=evjh0qz1;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iYHm2E0x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=; b=evjh0qz1Z+XZsjuQl86G2gSiEz
	3ny6sJdrHqEUAjjjlInqyq85EPPVa6u2dOltstM10btg94QCy3hZStL2RHLpBTpcgcghIZew94W/B
	Y9/1MyaIWPf1V7M5LxyywTxMPg5TKl/nAWnkHM0YL3XJwkCZ90skzXqqQEdC3mIQ6L3mSoK1qWOkU
	5Ok9EWQ08N8z/Bs8qePqKA7vX/2E7ChxGD8ZfrHmG/lI59JkYyCnioAdTDiuAb8+d/jZX+FH4QqQY
	5IvgDhrZ/WIOt3bdwlVdaH6/fa+RatByqNVti75Udt80hDCLXegbeUY92NLG5Lr1END68mBvluFvE
	0DrVFSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLWe-0000000BTrb-0oyq;
	Wed, 25 Nov 2026 22:31:40 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLQ6-0000000BSM5-3Lf5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:25:03 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8369457eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645482; x=1796250282; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=iYHm2E0xQQry54Mtyj7ooFN1D8mL0KoDr21BcAZZTrBcHBGXfYnChgz8nXDMvL1C/j
         jsJiEHONPxCHDJAJq1rKUzbD1drxMXdGvi4evnhGd7w1bsnruDrmAeMgOZdEu+oECn/H
         WVsl9YE+OvkcnsOne2suySiAdP7A95oE5AlY7GYk5pCwy3cXRufFKHl0KtMo+GnGQgSb
         /dyRDVnddEYl/Yz56VB6lC6z3732JoYApOtYxcpOjzzClu4qbWyVCS4DGnXaQTWu97Ps
         UvSJbFe/dbzySTPjuS3ni44tF9JX4TL/yaU4t2LuhxdZb6eA0+32bdmUTwQbaqCuDdxo
         PRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645482; x=1796250282;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=AXTGAOD+E4MzVVdmTFS2v3RxOLDcgmz0YQ7sCGhyPGlI8abx3yP6yykyv3zTrgg1oR
         pfjJXtAFOwIdGfnRI3u56dC23R821qdaXSn1lw36n9wn5N2kU9F/PGq14RXaXdKRJj9I
         KngCHw3bg+wG1dCCcRKhK96tPkwoqYJHQtMc6jfPW7T6T1oFsA7Y8WswwyHa4F7iVhCr
         UBYoS4ku49dV3CdgGA5WpQxe4dvZil7niU1ZGsOsRus/ko4M320sVLqIFqWKJ3yMU9Lg
         0hZmeNi6pKeNH/zlxWxqyZj163FYllT9tVskz3Qy0mFEkoBBj3DgpcRosZ+6NOYD7cFp
         kIyA==
X-Forwarded-Encrypted: i=1; AL+hErEZuJ0EBOtBIVS1B/P38ou+7jUhVYUXKqSmXVSwrHiB5jOCt4Pz/5TZS5HFfzqzodOrtvip/tBpJRMVlaKo3G6V@lists.infradead.org
X-Gm-Message-State: APuU4Z+WrniZZ4FGCBL4npR39rw5+/rTnWC4n/9j4r1+jNyyfo8FBTe0
	6QUI1C2jp4gs2eWU7T67NqX7OeSgGwtQ9hIeo/1kwP4aeBY8BJWG9ZIg0ur/LilPIob9MaONv1Q
	IsA==
X-Received: from dycuf5.prod.google.com ([2002:a05:7300:105:b0:386:9be5:2d95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:638d:20b0:375:c862:31c
 with SMTP id 5a478bee46e88-38571816d35mr18955075eec.40.1795645482015; Wed, 25
 Nov 2026 14:24:42 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:33 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222433.1442338-1-elkin@google.com>
Subject: [PATCH] iommu/arm-smmu: Fix use-after-free in nvidia_smmu_impl_init()
From: Elkin Cruz <elkin@google.com>
To: Thierry Reding <thierry.reding@kernel.org>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Krishna Reddy <vdumpa@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_142457_385681_B4494C0C 
X-CRM114-Status: GOOD (  13.34  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In nvidia_smmu_impl_init(), smmu is reallocated with devm_krealloc() to
embed it within struct nvidia_smmu. When devm_krealloc() moves the
allocation, the old smmu pointer is freed, leaving nvidia_smmu->bases[0]
dereferencing the invalid pointer.

Read base from nvidia_smmu->smmu.base instead of the stale smmu pointer.

Fixes: af9da91493e5 ("iommu/arm-smmu: Use new devm_krealloc()")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 2fce4f6d4e1b..a3884966dc29 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -319,7 +319,7 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 		return ERR_CAST(nvidia_smmu->mc);
 
 	/* Instance 0 is ioremapped by arm-smmu.c. */
-	nvidia_smmu->bases[0] = smmu->base;
+	nvidia_smmu->bases[0] = nvidia_smmu->smmu.base;
 	nvidia_smmu->num_instances++;
 
 	for (i = 1; i < MAX_SMMU_INSTANCES; i++) {
-- 
2.56.1.839.g22a8290db9-goog


