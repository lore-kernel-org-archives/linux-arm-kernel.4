Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5907606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iXoDqtdW;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=GQhNfocI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=; b=iXoDqtdW1q4VUt
	aJcKWsG3BYN8y4bHYqW7ZY5JQjC83yB1qHNKdyob2c0iT0dV0pV8+bzKsLhmduA0vK0JqkbcAA6EC
	Do0UfU3BdGyCkuD5QSjM1kHvUcKPiblIe3TOVhPHGQnL6SMqKFpGMRUDd4QLndaDM+HoPFR+EPkRg
	Pngg+/g07z0OZSGgihoO3Cpnu0ROfFpm1ezvYF1lyOxvWTVBm5fTfHxpzN7Ahr0zbkhb0/zXkw5mK
	yMitPco9OdT+vX6kjANjMKpOM3RBFz47N5eYYHCc/jsePhOrL1Cmpucg4TMPlXgv/VVRYE/UMKzo6
	1O02+uq2vulKAWeuddag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vz-00000008lEu-0SZe;
	Wed, 25 Nov 2026 06:56:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vm-00000008lBw-3vtO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5017049f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589797; x=1796194597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
        b=GQhNfocID9wKzkHNXD5MPzoxycvdOt91dyscj4MJDIuLAuXlpGmWgKy6Nwk5BfGph3
         1hxcaHEctUOS9wtP1wZ5FCzphqJW2819YQ2yYa+6YtdnupxjvY4q7KRLX4FvydltZYEr
         E05I/fJC0P74CH5wpgGdED1TTgcX5dFjb9Hfr0W6z8skBI844gUBBiV6M32qdfEIFHiJ
         4wmuxwCf678ofDs0yAJ9n0A7dWX8cGFinErAdQ8yBUCshIy0Sqr4rSpgKRVA/7Nt+wx3
         xwZiwMm4j8vf/Ajk8yw+jtV29/ASXI7JeWEDn6P5Fy/4qScpLQEXBPfQKMsMi5UMBQJY
         JxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589797; x=1796194597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
        b=g8cdGfSykB/Nm2ToSyyUjoax5P78/Byaj0311ZxVU2MH3KO1OBaMgOFcv0CFZ3qQGW
         GZ9iD8W0tUntQRTGuvyW80Wt3G2JI15tPtUBuhcfubKbLTeWaDXhTA/FpRdqqQP1dt79
         yzFZVONmKlMTS8M+PgEB0i5rqtRrfZnYaqoiEeHsBJyr0boYuxWIYpjB+lUH8lKjsW69
         LU5+/TEbyQqhakm6V89xi8Q9kKy1hI++L5WLrI7jCyvr0qgpa1e7c4iia86gjAguOain
         XkSX6+V0h4RFggVCxxAf675BzWnPTskerOYjyOynoDNA48FrkT9uF4PCR4nO29Elg/nl
         +NJA==
X-Forwarded-Encrypted: i=1; AL+hErFIj/wC0pK7GiMs7PACPzJFWGZQ8Aa+Oxb3W1CRistTfoiN4WwWe/fVSw1YTz/pquD42B+AeXLXTqHbVVcc6BW8@lists.infradead.org
X-Gm-Message-State: APuU4Z/ETnRL3DjoLE6sB7elJWRmBXzDgFRL15K9qvKk5qO0BHj3kCZg
	gNLNSP5wEEj2tHn+tjHYHnVcuRGIk+Y+Nf1Q0EjofwFWme+WRJYg2RRVA0HCLLbB3i0=
X-Gm-Gg: AZFdTZdVZicLLTitmvZdblVK4nZtXW+nKe3jSvZBH+SQxrblmQImp0SXqyGUTbZOL87
	fix+fOZa7kzRd745nnN3aFtcS4vNr4cNOTm2JPgPm3ktgyvq2CW2J1CjvysuHFcOzWIvKDna6fG
	2f1jzC1CfiNEukvPcuW3UBZLK3GsJbqT3omZQrr4l4gLM/vMyJKFUrJgaMRPz1o3vjYny9WCoS1
	4kFWcLELRcqgJzkUWnx8yp6LFHiL8sYddjrWIslKW2llBRaNfN9Wq8La2UnmILpKQAPBDWUgOGD
	f6egNimQO8EBupemcCeFSg6Jx6xwAsZAyjjZFx+KjZgo2DiE1VKro7JwBzHLs4uQ7VImyeXbb05
	hKuYfiqYNKpHB1QMBZQBocBj7y2GlvfWgB+jXcr/G84aoLAjxdnH/AYB5Ib/addkW0OqZqAZORF
	Ac8On1cpMzrREgoJjBSqsEUzKPIbbf+UiSsT8K4oxGGrRbT/u7WhHq4sazPqHCzC/vbz2rfoLzz
	sDaWyfdX+0PyRK/bjle2oizqi01myebKtl8yfHZytt7hQB3NMMN4WXSz5AwEsIg6znU0arn3sSL
	Lvlc30SI0Uy3i75Vq40=
X-Received: by 2002:adf:ee47:0:b0:4aa:5396:a792 with SMTP id ffacd0b85a97d-4abb514608bmr25076345f8f.23.1795589796866;
        Tue, 24 Nov 2026 22:56:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm36981016f8f.24.2026.11.24.22.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:36 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:16 +0300
Subject: [PATCH v2 1/8] KVM: arm64: Drop an incomplete MMIO access when
 resetting a vcpu
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-1-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_225640_317404_6934DD7D 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -1.8 (-)
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

When a vcpu exits to userspace for an MMIO access, the next KVM_RUN
completes it.  So for a read, the next run increments the PC counter
and copies data from userspace to the destination vcpu register.

A reset should cancel the MMIO read/write access.  Otherwise the next
run will copy memory from userspace to the vcpu and increment the PC
which skips the first instruction.

Clear vcpu->mmio_needed in kvm_reset_vcpu().

Fixes: 45e96ea6b369 ("KVM: ARM: Handle I/O aborts")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e..26081d273408 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -199,6 +199,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset core registers */
 	kvm_reset_vcpu_core(vcpu);
+	vcpu->mmio_needed = false;
 
 	/* Reset system registers */
 	kvm_reset_sys_regs(vcpu);

-- 
2.53.0


