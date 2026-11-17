Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3924606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uIJi0Sqw;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KWNEoel8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=psREq3c91VndNY3eQzrAWuiCYYim0nrHRYcBTY+XgxM=; b=uIJi0SqwY8ViGpHgAQPYSnORdP
	7jlNfHi5JHDDALpiJlLbJcZzR3lFJ8Qy6XDPR/TfZLVFpwWh2aB6PHSQyy7oHGsEW24PizCjdKcy+
	iFvtrehNvnco8IuOkrS9UMX+4DGA8WirGLJv/zJhEIK/bsQtDDhPtMiC7rS1GwBcc94x54vApi5F/
	VnyFsOfKhElXOgV4at0BsQFWJQ47Qy5RChIPbl6asysUHsMs2VGWzkm/bnPHuElUfRrVDtbY4QXvY
	HvqPA1h0umxsBx/cpe6VBgTukTEy+mgF7kM1HWf2wvLHzGjdh3AUm9+pLiarMxqwpoOLTN9zCsGP8
	cgXjaLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEy-00000006eWw-3yop;
	Tue, 17 Nov 2026 17:45:08 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEQ-00000006e0X-3uU9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:37 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso16523f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937472; x=1795542272; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psREq3c91VndNY3eQzrAWuiCYYim0nrHRYcBTY+XgxM=;
        b=KWNEoel8tkZenF+ZiJ0KQs4Zb+RIpO+SiltTRpTHTqIzfCeMfI3VUKiB1+FMyI+5oZ
         6Dkt4M4OwqTanQsCGcVKFYG7+ML/TgszHMEwm1YkpAYs+n9KxPQk5PL9bOL65FVMDBEF
         rYqMv8iFU+RZ7eiuJPFxtg6NFXhHlww3AY/w2xZH+rPkeFCoFT4JjH37mE6qlL43hA1F
         ThtU+wQ73dq1REpD1m5C5Yv55N1ANxFRy1V2OWXNgm0FqG+XzPdclZpTQwvSlpyR2MNI
         XbVxoGMoq4Zx4/FWYKshQKkjL1SO/NGbmvQ/v7GAp1sZbdZfTT5hrIoWWyPsVF6OrcgE
         9BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937472; x=1795542272;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psREq3c91VndNY3eQzrAWuiCYYim0nrHRYcBTY+XgxM=;
        b=NEoHmZlUri/3QLMNQLvmx+KuZQxik9bspVKTU/xqK27HntHBHt/kQGZcCoQugqWZbI
         RId2JEnKhDk7j+JaIzAvMYkrg+xH1h7h3Ap/qzEBRWoYlUj3bmsThzkKIqTpmXekP/eR
         N7adg+Q4arCImeLyudSq6OElbbFcmqg6MRcFD3KvLmnWjo4m3iaVEWFeZ8RkIdvtJkbz
         jmyrn1Xm510RfvgCsNdjmwzLNqwpo0boOMElp3uTKWKykngcEQ6pIB3J5zz5IAbxrjLA
         TzQOFmDDvmgl66NmVAbpCZ4LrcNA9miBJMCD+Nb+sStAwsGMSS3klW3h2L5Vzw+wM3nn
         WUOA==
X-Forwarded-Encrypted: i=1; AL+hErFjaD9QyJp+9kWfJG+WzB/N3RAOJHi2Kmr2CSs6wnpfj3Hr4ghxKypKocaNbo6EDBHxIAL6khFktYZOYSpSumVh@lists.infradead.org
X-Gm-Message-State: APuU4Z9IJMKtSo99C+8PQjYNFHIwmrQ/fTIxtEkmNugfPvEhiIzjc9pb
	lDdB1cNS/m/Rizw1NO1uOtT7Ub9ZfmCdt+OADSsWWRhLi9H9MZKTRv1iWA0A5IR9ZBQGbYEvg2m
	rL8qEYThPX/1On4d5SqOupQ==
X-Received: from wrcz21.prod.google.com ([2002:a05:6000:4555:b0:48e:4d88:ab1e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8d:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-4a63833975emr426004f8f.11.1794937472069;
 Tue, 17 Nov 2026 09:44:32 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:53 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-15-vdonnefort@google.com>
Subject: [PATCH v4 14/23] KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094435_175717_6938B558 
X-CRM114-Status: GOOD (  11.61  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
allow __pkvm_vcpu_in_poison_fault() to work with PMD_SIZE mappings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 68ed886e294e..b9b591533b30 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -994,7 +994,7 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (ret)
 		goto unlock;
 
-	if (level != KVM_PGTABLE_LAST_LEVEL) {
+	if (level < KVM_PGTABLE_LAST_LEVEL - 1) {
 		ret = -EINVAL;
 		goto unlock;
 	}
-- 
2.56.1.708.g77570a6a1d-goog


