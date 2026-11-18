Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9H7tBzX;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=aNzPlXdW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GV42NBFC824GmYTgXC3pNtMM+aqAM6VsyNgZJMIPRbM=; b=u9H7tBzXdKGTRnX1d3Twmf+4Dx
	pj5M4e2aXfIsxX8u891oVpNISJPEcKELPtmLqaLCDva+ChFQ4O2UmLDEFNj7cPPS5Esk2ACca0VHR
	3DzvSf5wtAMRkMPmxQetxHV+U+2ZucjD/WDuLiX+6bokCHcFY+qvd0tkMZZVhtM8++tSPJOA381We
	Ed31SGuUWLioOXIe6ZBb45MDKQi2tlQx7IiKUnWsFnsbE+ZQkE7H7jxbYapDWXWg42CpICPo/sETc
	T1s5IpNdFQ6cZMQLaG5taJHH50hWskrGTw7sPFO4d10R9wNEfBpbrDg95ZBjim4Sc8TxabHYM+n7o
	8MT/jTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfMJ-00000008uVO-2WYd;
	Wed, 18 Nov 2026 13:05:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfME-00000008uUQ-3ynY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:05:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7018185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795007148; x=1795611948; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GV42NBFC824GmYTgXC3pNtMM+aqAM6VsyNgZJMIPRbM=;
        b=aNzPlXdW0g6MOmcNkhXEI3CTY/3vKEZD3ZA7dlf1jcfgPwZ10ZVJuEKAOKlhu9kH7Z
         KNFqpjGWr1kU3NXjyhDqEA7/VrgKaIpkakSeLWmgd93f6lSsY16DmEYaZFP5hlZDjfun
         30muAGjHhpoMmVAYByBb+0LHmVe2Fzig8atVceB88T6sK+7UkdGESxseEgouYL0GKEDc
         p2eRUnxT0x56uXm0x+RBoQe5zCCudS0VfvvwcKhLRHg0u/UPvJTb6iBH6uqO1gtiLDbj
         gvRVKWNh/zOmp/l+iJyZy1yISg/VHcWh3ZDwWrCwZaolB7fJBgb0ciZmhDPYzsEOEbYa
         9jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007148; x=1795611948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GV42NBFC824GmYTgXC3pNtMM+aqAM6VsyNgZJMIPRbM=;
        b=0F4xOCqy1WkZ8axz7zgBgTl1IWfXqp+B/4xcYGO/EedUTC2ng131Wol+EllDJzKcuj
         HDVvPgzG/QANBiFeT72bmM8zMXtLwkGxXfe8nrWoXLLXjGjsOu2dJbPa+h1uYy/vCTRs
         03fIYMGqDmd21k427b3zrX3RBZoJhzXAtVvGzFD6ylzv2DlNSwjVVrbaKy91tfMFIqQw
         R33XJke1BtL3Rw45FqzyiaD1tnRO6usIgwgBhngWR/TsagoksCF1keYO4FYC3HltEgrO
         P+op3/2h3ebN1ipur0kJfHgLMLRccySEwWcfw/0ZgWhBcCReB1utIyi8wKXKiUovzSIL
         ZTkQ==
X-Forwarded-Encrypted: i=1; AL+hErEodIkZb3jVNG5/EsvX7QpuVNCyqgrRYY6xsLa0UxP/rv06Fb+MVh/KhFqPwt6VHl5dfNJzJlYsdVZlb38qx3Ki@lists.infradead.org
X-Gm-Message-State: APuU4Z/YEpqWegKteL7+eUAiyQLwiQ3bB28LkCFdemGf23BnTqK1/w/o
	o43dGecDJaF/VXHWmwYqcNGNZlkVGZ+MvqhbtgKQ/L1LGgWOVMJH+k4jwTkyLiiyW8M=
X-Gm-Gg: AYBFou2jp1H33Gv//JR/po4LFK5Z3lwpM+lGpKKFDcFrjQuWOynq3sej7mGaHFRfQHo
	cPHoe51i+5jgWzFuKAfzXU/SmA5s5ZQpOgCP5d64kvnknpnuQOOTrK40t4Qyh4oH9er4+LQIdDx
	mOT6+mdxWvbCWz7cVr9cMhxHFdZ50tB/NsxOs55o7mWuwW+RqjXkx3a9Ej6ryTRH6kV673Pkkjl
	FekRDPN4KHDxgUCv8x38aVAbjpZt+HuO+7/nRFNyJo1UEttqcqOkN5cdk55miwdkGoCoPYIN/SZ
	ILOUuBhZuwJeNUiM7h6orVuV/z3IdAk3PHK2QweU9rLp30U8iqMZVFFgLZaMsMLT1GBBCfx4IYG
	+/fej/bcPOQ3I8T+nIOFcuK5ZnezWzrMZ4wCKqzvbc+/Gy1nSXs2TEsX4Z6AwSDJmkxmbW0kb6D
	bsuUO0f5ZBsjNHoMhOlPr9rK6FSMfL0ewDXXivMWCjVfS7iu81kYq1CGf0mTa75L3dal8EhrOGG
	K5M4JJYT7qzdOJHNg2ad4XAXW0f6CSjvqV2lZVkPPNrVEzy3mMrZYxCvf3KCE0ExGP9RSqx0A62
	nrlvxM/ngsd6VuQGi3WS6giwvks3R6wW9QpkkI9V
X-Received: by 2002:a05:600c:524d:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb7da46634mr47832835e9.30.1795007148303;
        Wed, 18 Nov 2026 05:05:48 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4f5b87sm42724095e9.2.2026.11.18.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:05:47 -0800 (PST)
Date: Wed, 18 Nov 2026 16:05:44 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH v2 1/2] KVM: arm64: Load the vcpu in KVM_SET_VCPU_EVENTS
Message-ID: <033a2d49e0f48426281b46eb1131ae64012aba18.1795006659.git.dan@pereq.eu>
References: <cover.1795006659.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795006659.git.dan@pereq.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_050551_384369_EE0E5792 
X-CRM114-Status: GOOD (  17.64  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Nested virtualization can trigger a NULL pointer dereference of
vcpu->arch.hw_mmu in kvm_inject_nested():

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000084
  kvm_vcpu_put_hw_mmu (arch/arm64/kvm/nested.c:1046) (P)
  vhe_vcpu_put (arch/arm64/kvm/arm.c:827)
  kvm_arch_vcpu_put (arch/arm64/kvm/arm.c:860)
  kvm_inject_nested (arch/arm64/kvm/emulate-nested.c:2903)
  kvm_inject_nested_serror (arch/arm64/kvm/emulate-nested.c:2976)
  kvm_inject_serror_esr (arch/arm64/kvm/inject_fault.c:365)
  __kvm_arm_vcpu_set_events (arch/arm64/kvm/guest.c:827)
  kvm_arch_vcpu_ioctl (arch/arm64/kvm/arm.c:2017 arch/arm64/kvm/arm.c:2157)
  kvm_vcpu_ioctl (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4772)

The KVM_SET_VCPU_EVENTS ioctl does not load the vcpu, it just injects a
pending SError or external abort straight away.  If the vcpu is in L2
context and L1 has asked for the exception, kvm_inject_nested() puts and
loads a vcpu that is not loaded which leads to a NULL pointer dereference.

Load the vcpu in kvm_arm_vcpu_set_events() so that kvm_inject_nested()
always finds a loaded vcpu.

Fixes: 9aba641b9ec2 ("KVM: arm64: nv: Respect exception routing rules for SEAs")
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
In v1, I added checks for if the vcpu was loaded.  This version calls
vcpu_load() in the caller instead.  That's more like what x86 does.

Also Sashiko found an additional bug in v1 and I have added a fix for
that as patch 2/2.

 arch/arm64/kvm/arm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 84a52e27ed85..a148e80d0aef 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2002,7 +2002,7 @@ static int kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 				   struct kvm_vcpu_events *events)
 {
-	int i;
+	int i, ret;
 
 	/* check whether the reserved field is zero */
 	for (i = 0; i < ARRAY_SIZE(events->reserved); i++)
@@ -2014,7 +2014,11 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 		if (events->exception.pad[i])
 			return -EINVAL;
 
-	return __kvm_arm_vcpu_set_events(vcpu, events);
+	vcpu_load(vcpu);
+	ret = __kvm_arm_vcpu_set_events(vcpu, events);
+	vcpu_put(vcpu);
+
+	return ret;
 }
 
 /*
-- 
2.53.0


