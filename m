Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uFxXtyPx;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FL1O9KXV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kOOB7/7inZWgB6bfqOXg88UlMwSiIOg40Npokp5gZO4=; b=uFxXtyPx00aoX5zu0AD1lucmmj
	/96sPqn7V453HEFMqW6tOleny8iGat50DQGp3iA1zYdlGstIstDeME/7S/SL2D1ibjGCmUbszPAV1
	HcJzc4tYbMAjaR/ot7Wwwlv3WKgZI6OiI6RC2Fcz2nju5aiqtgTcP9FkhCAIzmuhoQj5mZl0zuSiR
	fO6jlFEItwJg91xU61Q4KaCfjI8uIDQ9NiVILPSRuFE8HSanZcxdFD6A03BZUw/BRxxpk5fNGBjbq
	umYz36XDcAIv4mHV7LtC89ryR2AEBeJPFlpcqi+3CicE1MWB2h7c98jwDOUaXupcKhHJEHD+F+RYt
	AE2xeo5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEz-00000006eXy-2y4E;
	Tue, 17 Nov 2026 17:45:09 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNES-00000006e3A-3E8h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:38 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-490ab0a20ebso13703f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937474; x=1795542274; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOOB7/7inZWgB6bfqOXg88UlMwSiIOg40Npokp5gZO4=;
        b=FL1O9KXVKzUaW2XRS83y1LVUp8JpjunWspTPdf6oyIKPUY84QWS1SGnHt4IQHO4tYw
         GFUTZR6PmUVZiH+/J4dofA3DhhqaBq/2JQRur/mP/YSN3SRSuF/PwMVKoi91BYHKi0o4
         ymWiCV7HvlgJ0YPrjk3s7JNhDi/viY9MZ6WuaXu5HmewSdNPhkyA4ckVBQT78+V8oUT5
         nyU5XGxr0GqrsdClsmKMhHkLnUG+Cj5HEejNCvBILbg5JB951dOdB5LU8s5OBvucVRJD
         l9tBMNijCJ9wgZx2I5sXedZTPa7I0K57K6lZnaGhSQL/RSnbQbjA9tqO8akgJsj27xIF
         HUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937474; x=1795542274;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOOB7/7inZWgB6bfqOXg88UlMwSiIOg40Npokp5gZO4=;
        b=l3eZwcyO+11Z9/Hxfq2iE+WriRQyu6+JURVDVwRuAj+7n/IL772hSAB9ZS+Xa4kK20
         SmV/64bawaEacjPx+oneWFuLG/2b4aVQsof2hc+IvrmROtCUZzwXLFAc0U8FBt9tVd7r
         Q3+xdG5v4UPa/iN2dK32yREFoQT+zyw2Lk9Y8fBnXLmE5eC/GtYQ+2EAmtx6SrJAqW7x
         5JTGWqpaYGEF6qf2vqqnfxJ3dHspDg1saSUs/svpGB87ZwYuV9aLdPjf7z20m1EAEvSS
         gmyLQM+Gbsgedqq2C/8EVooMJQbc9E/zKx5yMnvdSAn1ix+RLxWwzNGvIs5ATPpg9lVf
         j/BA==
X-Forwarded-Encrypted: i=1; AL+hErEwZvjuGRLzKtkYYrXH2FBvxPk4zl1kWxyagFSXuFQz4jaTmJGr/TOLf69aJkqD7tk4D+XuRwueKW3jsbH1ol2H@lists.infradead.org
X-Gm-Message-State: APuU4Z9tl1mSDj6Lb4UGN7dTxbF6f7w6YOf4HDV4u1qjmVUVjj59Eeal
	Az2yEYADEcJtZNwuVNaix+Np3pq5DbQhVj7zR3dL8sOgGd/yliJPev25+fHQUWKZym/SeUVI8CV
	EQBf+aupgbAX4KgloDXm+Ig==
X-Received: from wrnb4.prod.google.com ([2002:adf:e644:0:b0:4a4:9fcb:c0d2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25c3:b0:4a5:8e3c:8946 with SMTP id ffacd0b85a97d-4a63a2d6fefmr432385f8f.27.1794937474303;
 Tue, 17 Nov 2026 09:44:34 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:55 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-17-vdonnefort@google.com>
Subject: [PATCH v4 16/23] KVM: arm64: Warn on pKVM guest stage-2 block collapse
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094436_830807_F6685F9B 
X-CRM114-Status: GOOD (  10.31  )
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

When pKVM is enabled, the host relies on a pkvm_mapping tree that
mirrors the actual hypervisor-owned stage-2. The hypervisor is not
allowed to silently split blocks or collapse page-tables. This should be
treated as a bug.

Therefore, WARN on guest stage-2 page-table collapse which would
otherwise be fatal anyway.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 751f76d3ec39..88af0aec1ea9 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -226,6 +226,12 @@ static void guest_s2_put_page(void *addr)
 	hyp_put_page(&current_vm->pool, addr);
 }
 
+static void guest_s2_free_unlinked_table(void *addr, s8 level)
+{
+	/* We should never collapse guest stage-2 tables into blocks */
+	WARN_ON(1);
+}
+
 static void __apply_guest_page(void *va, size_t size,
 			       void (*func)(void *addr, size_t size))
 {
@@ -294,6 +300,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 		.put_page		= guest_s2_put_page,
 		.dcache_clean_inval_poc	= clean_dcache_guest_page,
 		.icache_inval_pou	= invalidate_icache_guest_page,
+		.free_unlinked_table	= guest_s2_free_unlinked_table,
 	};
 
 	guest_lock_component(vm);
-- 
2.56.1.708.g77570a6a1d-goog


