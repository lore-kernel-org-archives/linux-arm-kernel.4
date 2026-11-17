Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C22606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IuwZYokC;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MnqjGEyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JO9s6pbhLt9HaIOtsyrhB78uzZkMKh5talCGkStqaQ0=; b=IuwZYokC3xwBA2+fWsaNWsHEFo
	4GUXx1+U8JbowPc/e3BhCa1q23sbih+MYFoxG6nGqiDmS2Afa0IwXxz1bAHHdyiUMcBVP5m96+2+9
	vqgyK6c2nzLSSFj7zwaGJS0LeaOH/O0rnDIhfTiD2C1ogPXbK8F+VaU0qzMnrHsRGSYIN4mSw5J+O
	Jur0KtLT4XL1PHSMcQSsA9YTayI1UMt1Tid7oo9DANmCmYRu/uYUPeCAUaTS3s2B8EwDZ1IXuvq0H
	tajabQAXx2g9+GLd/S17BjCgXr3Trj8KdOaS8tbtE2oUOhBPoxSd6KpliQxFu0XLSk8p6LM8FsE8w
	0FDNb1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNF2-00000006eei-3cty;
	Tue, 17 Nov 2026 17:45:12 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEX-00000006e95-2D4z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:43 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c50e035a2d5so268918266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937479; x=1795542279; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO9s6pbhLt9HaIOtsyrhB78uzZkMKh5talCGkStqaQ0=;
        b=MnqjGEyzW+UUwlePD8YtGNx0twY8dbRrzrUUJGoIkNRZK75O+kuxTZV4wRDV2yJwhB
         5uTKWfWgTEqhZTodH0z9t777qTKCMAQkDuQDF5SbcmVShiifFcdp0CoP4zRt/kAMQfBk
         H/hLCQHvBJ5EMtvqz25YcZug6x/9osbyNmZ2es8iq4n357lmbkCpeCR953z4/J0NfOTi
         2YCt4yXdaRclUjx56s48Dt6OyOYujmBq8qs4TuiuN/svUZEDmeR8vBexKJE5TUeYMT25
         Er+7OwBoAUxRIDs15mYA7NpIK+pJqMyxX26ova2gsNS2hYl7t3M/pWJmFYEHBb9F9t7A
         Sx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937479; x=1795542279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO9s6pbhLt9HaIOtsyrhB78uzZkMKh5talCGkStqaQ0=;
        b=wJkg7uhV7sIlWG20rZCqmH63bNIP1fpIi/EF2sFYsPsUCqeizYuI5+i91zYbjahH5g
         2I5l3I4fOqrIkop4qr/irFfqAn+iJJbgLKJD3eB1yFLFf93aT9nGiB6dVqi+WpY91h0b
         rM44DonhjNvEIIYA16yI/tVdJvJY5fY630t7vAHpP9Dzwmc0gU/vFoWrYoghHHGKWWuz
         BdxcdG8nlxoGM0/Pj3EEekO3rBAuOTkzqW4XdXUWQuq7+E0k4DX6hy5I4OhghCefBpQh
         uEcHF/VPizhUOocDO6NyXwrh0l/vztpVxuTH/Jwchui8eXGek956LTzyBzJl0/ri+pFf
         yqZA==
X-Forwarded-Encrypted: i=1; AL+hErHOJ2UpzAZVr5SzP21B/F/ctD/EGfTLhIti3To8/Sbc7VR9CoB68KShS3uEkvRuLg5xj7NVAgpvQ0ymifZRhxJw@lists.infradead.org
X-Gm-Message-State: APuU4Z85hfKycY5YAowaMQlTmWHbrv77CUqyXShI04cktG6C0suHX68H
	cwHrltp2tkQ/CxT3PXYHGkRu22wsOCbkMSSHazw5xbbSF46urveW5z8EUkdlcTMWN/zsCi32kM9
	6biLLWzxnuFLOWnuAwIspTg==
X-Received: from ejblh4.prod.google.com ([2002:a17:906:f8c4:b0:c50:51f0:a2ab])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:94d3:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c510dc7e08bmr8772666b.0.1794937478719;
 Tue, 17 Nov 2026 09:44:38 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:59 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-21-vdonnefort@google.com>
Subject: [PATCH v4 20/23] KVM: arm64: Extend pKVM page ownership selftests to
 cover guest block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094441_600981_5767F844 
X-CRM114-Status: GOOD (  10.97  )
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

Extend the pKVM page ownership selftests to test the split of a guest
stage-2 block and the per-page reclaim of that same block.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index e264cfd41e0c..28fc89725666 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -2128,6 +2128,47 @@ int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
 
+	if (size == PMD_SIZE) {
+		/* [gfn, gfn + nr_pages) was poisoned. Skip it */
+		gfn += nr_pages;
+
+		selftest_state.host = PKVM_NOPAGE;
+		selftest_state.guest[1] = PKVM_PAGE_OWNED;
+		assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+		assert_transition_res(-E2BIG,	__pkvm_host_reclaim_guest, gfn, 1, vm);
+		assert_transition_res(-E2BIG,	__pkvm_guest_share_host, vcpu, gfn, 1);
+		assert_transition_res(0,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+
+		assert_transition_res(-E2BIG,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+		assert_transition_res(-E2BIG,	__pkvm_host_reclaim_guest, gfn, nr_pages, vm);
+		assert_transition_res(-E2BIG,	__pkvm_guest_share_host, vcpu, gfn, nr_pages);
+
+		for (int i = 0; i < nr_pages; i++) {
+			WARN_ON(__pkvm_guest_share_host(vcpu, gfn + i, 1));
+			WARN_ON(__pkvm_guest_unshare_host(vcpu, gfn + i, 1));
+		}
+		assert_page_state();
+
+		for (int i = 0; i < nr_pages; i++)
+			WARN_ON(__pkvm_host_reclaim_guest(gfn + i, 1, vm));
+
+		selftest_state.host = PKVM_PAGE_OWNED;
+		selftest_state.guest[1] = PKVM_NOPAGE;
+		assert_page_state();
+
+		selftest_state.host = PKVM_NOPAGE;
+		selftest_state.guest[1] = PKVM_PAGE_OWNED;
+		assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+		assert_transition_res(0,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+
+		for (int i = 0; i < nr_pages; i++)
+			WARN_ON(__pkvm_host_force_reclaim_page_guest(phys + i * PAGE_SIZE));
+
+		selftest_state.host = PKVM_PAGE_OWNED;
+		selftest_state.guest[1] = PKVM_POISON;
+		assert_page_state();
+	}
+
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, nr_pages);
-- 
2.56.1.708.g77570a6a1d-goog


