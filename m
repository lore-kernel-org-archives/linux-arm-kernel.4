Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5342606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sixig2PC;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=QPBV0M42
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=; b=sixig2PCaAPtJ8
	m8mnZpY+58L3UlB/sbuesFyCaoDejf67kPZrG0ys8+/pKBQ7f+wGebdgcjqbg7IhdgNw9hV348wRt
	3uqmAUKZgDlPuynvoHx5Ic3Nsay6CREZmOQ4kbCjrQYkTobVdwEBPrZtreLXxZl+3kocF0vRh+FNP
	TSi6l/DKnsR447uo1LXbzQ+Id8OK030/MzcrUwVOCurAtpfXB/ALCake8NmJtVdiUiYGwPyfr2wgU
	Ewo6XIgiUyf0/D4Gqn8dN0rGCLlnVsSg6yxsIykwYxV2gIqGikKDboYTVXBPj6RyS7nVEmw8mZ/7X
	Uj57arXOOLScPBxT+B4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vz-00000008lFb-1sUD;
	Wed, 25 Nov 2026 06:56:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vw-00000008lE9-1VWA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so4674671f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589806; x=1796194606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
        b=QPBV0M428H/451KvUtcFbSovP2ILeCIaxFUQS/IfL4HKxFXJS0C4KrXtEwkQxpucm3
         S3xYx9oSF5UUyUiUymdZt1t9K8CDTTjCjnvKiu/513wRwMPrJawgq76NhHWkNRVuXtwx
         vjJEgpjtpvO68LOLbN+nKQUtfLj18LA5beILN+pcnNmkiZ6kjWQluIGPzaF0xhShSyBI
         +SJ9VfHx2MMNxIchZ+7TZ+FeUol5ig++cT6GPpLgKcdt2REIK6ZIdUMHrrcqcFpMC4U+
         SS5TtWLSUll7es7rAn7c6kRrvWwakOGN5cy8/kjeAL6gMpcGEKtm9Dh8Xi8xdKoDUu5r
         21Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589806; x=1796194606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
        b=mXJfR9MEIw+HlEe6TUUpljr2dRr6H99UH+Z5Zk9uy6eKikTZCzWiyT9vGk+QBT2X6k
         J5fPELieVNnCWh7wwr739rufTDN/5kjZcKgYtcXNgRypHAY2vCF+I+gErLzYn5p8gNjp
         nITRG8oMGOAaoEAs6EWHOxmV+XxCS8x8IZ++hq9cjMRHvw5UnqHoCZ6adAEKrHENb5lp
         v4NOBcQfuez7aA6mYK/ovZ8qg8IJ3fKg2ibWO7e5xGaatk3OD0nX1K4bPgn9corTz1wn
         8Jfy6/55igGXoCnbY3hoqU5h+9b6Fqrwn9dYn2+sw9mHB5GHdcYqCdHS1E3HNgEcKfbi
         CpFw==
X-Forwarded-Encrypted: i=1; AL+hErEpjOLpnKWUx/4Ygg2uC4ErvZGrsqiWhUEs5vxhYD8sxlxr7ys8EX6eo2pT+8mMRCcg7PcV+yTjH4q5NA9QyIhE@lists.infradead.org
X-Gm-Message-State: APuU4Z8GzkYjHe1hh3Dh8dLhh9izGxgcLynAkFF3h3FKKb+2tSQbH3Vl
	jctVoULr11/SGomZaW+igFls8YQmHGfRi1RBoh+qKaI0417ZJLpLUHjANY6h9drVBXyj8qS8a2W
	qitD4W1Q=
X-Gm-Gg: AZFdTZdriJZarVyD9lR2oZ+l24KFwWTfkrp6Pg0CC/ctODOK3NzKzOG3mGrvF8Nyomw
	gkvJdmCQmXRAmmTF8MTt/nqK4Ebk9fKh8jfdWbLYUKbN5FAk/g2vWAC466OLZvrl5Fa8jdhLBxc
	Vi1xPaUQaUA9kPW8c9K256rNFiQ6MFPB7mxleftL7CJY2+iroKSEH/nV0HXHkq2alPRucZobfsC
	e5AhJGTxY1XunVYJQBxJ2kP1lSkWGjxeM0VdtxXuAVt1ucu669l/7O1J8kU9ot7P3MMnlDtz8y5
	v1lqleuy6Xyse4sywpiVd7pCL4fUdGXCpBuK/zUGVXl14aIyGL6LjxI0/wpybAOvXl42OoRjB4T
	JS1cGMfACFe8skZH2WIQLzhobbxCpwJML9fiMoPGS2IzVdEpR+CnJcqzH2iUhMLHGfeCM2GliOX
	31N8QPTcHSXsfRE5ZJji4EbNgZ0bQ5AVddNbib0wnJPivt67EbjKbVNTwdwJszL+ch5yjqD40KJ
	KzQYLO/z0NoLvF5zlj9sup0wpm8oga5dlESPlmxiKU/o4NOUHLNIPtPX2dihvHNwqx97AsNo9iP
	oZPoWqEnk5qDil9Fin0=
X-Received: by 2002:adf:e014:0:10b0:4a6:b87:d799 with SMTP id ffacd0b85a97d-4abb400bb42mr23914238f8f.17.1795589806244;
        Tue, 24 Nov 2026 22:56:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm29125406f8f.17.2026.11.24.22.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:45 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:19 +0300
Subject: [PATCH v2 4/8] KVM: arm64: nv: Discard nested SError in
 kvm_reset_vcpu()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-4-224689d8a764@pereq.eu>
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
X-CRM114-CacheID: sfid-20261124_225648_995628_AA121A30 
X-CRM114-Status: GOOD (  10.95  )
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

Vanilla KVM stores a pending SError in ->hcr_el2 but nested KVM stores
it in the NESTED_SERROR_PENDING flag.  Clear the flag for nested
SErrors when we reset the vcpu.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: New patch.  I split it up like this to make backporting easier.
---
 arch/arm64/kvm/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index a5d298d5ce61..d80b38b2ce6c 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -209,6 +209,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Discard a pending SError */
 	vcpu->arch.hcr_el2 &= ~HCR_EL2_VSE;
+	vcpu_clear_flag(vcpu, NESTED_SERROR_PENDING);
 
 	/*
 	 * Additional reset state handling that PSCI may have imposed on us.

-- 
2.53.0


