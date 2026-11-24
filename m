Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEEC606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJBfH02N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=beI7d/6l;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jd7zd8Zd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xEQsJFX0RjAEIhkOhgWbTrA87lS1Xyb5WdXAbKYHdxs=; b=JJBfH02NTtuQEIVTYNLNXGUJmW
	quDqkhgJR0GiY28Qx2n6N+HwrF8Xr9YmXYj+XPixBha8rLEEBx8V7RcIvkBr/6nm/kQFTyTOO71Ri
	YBMhrig3LX7ztAZCRGrY8DgwELawpUVcPKmE61xXp848anZYW20XoljY0KXyAMFEn6+Oe9xC3Htks
	hApTJw86bDTNVKdumhC4KbiwJdpxvCsJZDBsHY6m7g33oJfs45SLNHTxhxEEkxRUxViXGsVzDG7l+
	aOXevejINkC9oJAt1Jynpf5bhWXwKR94KLCMLx/xL28vMUyDY692jPO2004UvE7hRTMGBQ5pjrpei
	ycSwB4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVteK-00000007AtR-3UK0;
	Tue, 24 Nov 2026 16:45:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVte4-00000007AhU-0Hx5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xEQsJFX0RjAEIhkOhgWbTrA87lS1Xyb5WdXAbKYHdxs=; b=beI7d/6lRMteC+tyZmVDI7dckS
	GU7ZWmlMbQmkl1Sd5yXQUN6c7ru3/x+FOWaBnu28sr4EDizRoXX+J1SJkriSDkMGUsuP/81VQYiuI
	JXJdPbVBI8F7xc4Wgf7UIclqPG2B07y9PTV22BqFNp7DakAt20ToEXkBURaYfsWzw0LEpDNSOn9W4
	s4JExa2/AdXNjeQd//B/F8DnhJjN3zRGNn0LdznpojW9oPynKFlMH4PeCOsAEKGPUNYlXeze4fzVj
	DNNDMuK7s48+ygeXt5dlxABeHFr1gYoC+nCvqg9Wvf7xixa/VCzlzDnSBMdwIllTaTUkGy8akBwuM
	22cJZ5zA==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdv-00000009Div-0yPv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:45:27 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso36791925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538717; x=1796143517; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEQsJFX0RjAEIhkOhgWbTrA87lS1Xyb5WdXAbKYHdxs=;
        b=Jd7zd8ZdJLgukmkH4ZZcVr69F71A8HCYmfTCQhNUr75IG2wfThQ1Wh+W6iWHBQ3qRQ
         OFxnEYJf8w5puVpwShobVjVf/OztCZBCz5CjEsCs1u+w5eRI5YBqjz8fNs7gpSfGBAUp
         fct7iD5WDt/ZJjJqX6SVuW+9hTW7KyIjjOycpJuTgSJxr2LOqCzHwjXYX72PAid+ikNT
         U7/056Pvi3fDtzHiHTt3c5XB3BjZ55djgAHCGvb9Acwf2nFC++u0/xENobrUWNzQPWiu
         CzTNu6CdvmP+Y/9aEdLK0YCI3feJWbtxfORiju6ZPA4Mk3PLXFdQq2F1N1nzwp4XTdcy
         XsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538717; x=1796143517;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEQsJFX0RjAEIhkOhgWbTrA87lS1Xyb5WdXAbKYHdxs=;
        b=so2qeaAAho7b62pzHtmKC4CB2VYyOIqXZYc+TspGDiwXXM+Tdk9Ko+q1LXv15JqyIk
         NBrIvvcxAbEGHmDuRQW0c2glg5+HiX1UT6Pk4OT+Tn9cuHIBzhXLkXp8P9vboLgjfwHP
         zG7UJb+//RzqbF9M3E/G9/oKAazAtBBk2X4G67FY7TOn0eEiEs9lfS+BlZw6tjmMTH+b
         Lu4oQAI+0Grz/blrATLyr+Jp+Cs5mvX1BATBOq/aDsA5ar26zC2OLBl9ShtE/1Sy0QR1
         uNhBdRfhegb8KQiifRAf9sKSIVhxyIwiCw9p07Bb2XfY3MP8qyiBCe/BTry6wpinfx2e
         wtyA==
X-Gm-Message-State: APuU4Z8ZP5NapVM4x0g5jTnhcmXpqjkmvNRnTA1dUdb5qIZT9P8ttQZk
	qG7JcgUcQFBJtg2AtOevgnsr+dG0galjiv65Djc7jrUEqOoihKJd9zDzTiyLIbqgI8wd3031Pi1
	PomC+sk0Oa3v5w9UUDsHulg==
X-Received: from wmhc15.prod.google.com ([2002:a05:600c:148f:b0:4a2:1459:4ee8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c0e:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb88824f38mr361240235e9.15.1795538716856;
 Tue, 24 Nov 2026 08:45:16 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:46 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-6-vdonnefort@google.com>
Subject: [PATCH v2 5/5] drivers/virt: pkvm: Allow granule larger than PAGE_SIZE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164519_875907_2E7FA8C9 
X-CRM114-Status: GOOD (  11.72  )
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

Both MEM_SHARE and MMIO_GUARD now support a PAGE_SIZE smaller than the
hypervisor granule. Drop the res.a0 > PAGE_SIZE check in
pkvm_init_hyp_services().

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 3852be6bd16b..e3363a69a7eb 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -135,7 +135,7 @@ void __init pkvm_init_hyp_services(void)
 
 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID,
 			     0, 0, 0, &res);
-	if (res.a0 > PAGE_SIZE) /* Includes error codes */
+	if ((long)res.a0 <= 0)
 		return;
 
 	pkvm_granule = res.a0;
-- 
2.56.1.809.ga0b61035b5-goog


