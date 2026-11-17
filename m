Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E4606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BWnl4hmc;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ki9nTMTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qC8LcM+3/L/7M3Ds4+6XPqLCUpbVU9jut2tvypbX9gU=; b=BWnl4hmcu8dUpMSUIiXQFfdExv
	2KH6xNMkDHK95glLPBmScTI10drkFTG+0KAEEd1oM90sRJeMbZ+pU7vzn+h2MzYg1r0pKu1XNaQH7
	SMCGR5Af+2jz5KsPg4nEtQBTxv48xn94JiQcgEdwdLjJy6s6VCVJGvdrFHVRw+9zO6sjOY8glO85d
	1t708mnl1z8s4sMVfdX3pmiweA3M54lLOPAW0lzdA1BKKQb1HKEfuMKtH0pgsnraYWeiSvW0tsnPt
	sr+tELPhQ5iP4Z6TD/TJK98gsbz9+9Jp4phkhrl4Gx+6bTOJIgvRw+szusV8pv8T3fk4K8UxPYQ4J
	aKYks5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEv-00000006eS1-2qkV;
	Tue, 17 Nov 2026 17:45:05 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEL-00000006dpz-05V3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:31 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so11165975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937466; x=1795542266; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qC8LcM+3/L/7M3Ds4+6XPqLCUpbVU9jut2tvypbX9gU=;
        b=ki9nTMTRZTD9kHZyv+R8/IWN+rYALueoZEgS8iGYPZmnqDnc+M+ALhIMcviS+n7Myu
         GE52Mz9NTP+e+8KwMohQUfIJs+uH4XX3pw8iJzGwbSbJcXy90z+Ou19I4ul3C6tLmk9H
         HJYnYwbhIozf3412w8g2A4CCX5oTG0YElWMh/AUnFRx5GIz2trtvjC5AaBqXeCgn7btE
         HfX/egl9KhALBFUeZpmgrJB3/oHQ9R6RHfpowVM7gfMitEd8muVezz95I/FpimwWPwzZ
         zDYIAE7W8ltS0cMvFXYCDPFa2Wa5vypSSiJC8pU+3zySh9Qvv2sh8LodQd1cX6KM7oiZ
         jMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937466; x=1795542266;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qC8LcM+3/L/7M3Ds4+6XPqLCUpbVU9jut2tvypbX9gU=;
        b=OzKXmyWWywOEhrGb1kn+BoklgT+JHZjAEXrK2vThyIonKPEzEMMASfMHRdo8wgMG/Q
         DCIKbI1x3S4UHHHOASMpPYWa9X/npYIp1YH+A5o8xkaNcVwzaa0X5OjtcGOp/1hrII9H
         xe9uouXIgliF3XOQPuDdmAizEgYC8o45xbPgMYx/Cp8NbVIn0I6zN7Wk6AEzDnB5pu+j
         AEHH56aCWhADiRAUioGlWyd/qUiTVLBCm+xsv5pXGE8BpZZiEAxQ/iwx2mDUydsSQkNB
         5IXUvEs1n+u/JxyM+23H9NdNx92z3N2dgCqB21m1fdcJ97EgHRJ9EwlguI/0vf3YL5jv
         wMUw==
X-Forwarded-Encrypted: i=1; AL+hErFZIKq/oKxeHzn/2sR69ueA3hYfiCRJyuwO1AiKUn8vCwyiHEQgW3WRi+XnnWYfHkivzqY5RB/2I6akuel1aYHq@lists.infradead.org
X-Gm-Message-State: APuU4Z/xoXanVCupURQknK/K4IoLDaVQnA8yjVo5VNsu5r6NLGJnv8e3
	OB8DQXzI2X8tvnabb6ZKKTxHKwxSMxax9Qzd0RHwjc5C83KSfHqQGCOQZtiBFWUnoa0o4j5eQ0o
	gIBtGFOFiUcbde5oDibUIkA==
X-Received: from wmbeb10.prod.google.com ([2002:a05:600c:678a:b0:4a2:826:6d11])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d97:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb78372629mr78331265e9.2.1794937466306;
 Tue, 17 Nov 2026 09:44:26 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:48 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-10-vdonnefort@google.com>
Subject: [PATCH v4 09/23] KVM: arm64: Add a range to hyp_poison_page()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094429_223305_75A1BD6F 
X-CRM114-Status: GOOD (  14.61  )
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
add a nr_pages argument to the memory poisoning mechanism. Use the
existing __apply_guest_page() helper which speeds up the process by
using a PMD_SIZE fixmap when possible.

Also, rename the function to hyp_poison_range() to reflect the new
capability.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index ed82cbe973ad..f2a9af6bda77 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1299,11 +1299,9 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
 	return 0;
 }
 
-static void hyp_poison_page(phys_addr_t phys)
+static void __hyp_poison_page(void *addr, size_t size)
 {
-	void *addr = hyp_fixmap_map(phys);
-
-	memset(addr, 0, PAGE_SIZE);
+	memset(addr, 0, size);
 	/*
 	 * Prefer kvm_flush_dcache_to_poc() over __clean_dcache_guest_page()
 	 * here as the latter may elide the CMO under the assumption that FWB
@@ -1311,8 +1309,12 @@ static void hyp_poison_page(phys_addr_t phys)
 	 * host stage-2 and would otherwise lead to a malicious host potentially
 	 * being able to read the contents of newly reclaimed guest pages.
 	 */
-	kvm_flush_dcache_to_poc(addr, PAGE_SIZE);
-	hyp_fixmap_unmap();
+	kvm_flush_dcache_to_poc(addr, size);
+}
+
+static void hyp_poison_range(phys_addr_t phys, u64 size)
+{
+	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
 }
 
 static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
@@ -1384,7 +1386,7 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	if (ret)
 		goto unlock_guest;
 
-	hyp_poison_page(phys);
+	hyp_poison_range(phys, PAGE_SIZE);
 	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
 unlock_guest:
 	guest_unlock_component(vm);
@@ -1412,7 +1414,7 @@ int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 	switch (guest_get_page_state(pte, ipa)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE));
-		hyp_poison_page(phys);
+		hyp_poison_range(phys, PAGE_SIZE);
 		break;
 	case PKVM_PAGE_SHARED_OWNED:
 		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
-- 
2.56.1.708.g77570a6a1d-goog


