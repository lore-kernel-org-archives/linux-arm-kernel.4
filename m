Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D1FcATDd;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MU+A48E3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=; b=D1FcATDdpwbTOl
	JeU9hK8YM412uCTp8xnU+2qyq1ANfX3z4/kxJoJtA9eb36UdSmyGq31/iaKCR3k/seC4j2koh/2C9
	fEMbsvnmsBrWCSTVFh4/8adEDgcpAj3A601pDqK+orLsbPIhRfIP8MlbovGxwSughScd1/uDcZ5SV
	PYQ+QLzeOqaoPQEZ381EoFj8MUf9m5nkW3pa0wnWn+z7tvQp+qhLVWhDm+tfEmfcIo1iQCMfL74l1
	sTYDX9Buy8GtdnNLhNMQN1abgxf/VSZvq9FYQogmF3zHv2G3pnUHyTaRqCakMn85J9Nxphb109H/x
	zvEi5mDVNKZnrnKlcQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vz-00000008lFE-1CMP;
	Wed, 25 Nov 2026 06:56:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vt-00000008lD9-2KJ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5149672f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589803; x=1796194603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
        b=MU+A48E3HLDmAX/jV4Fq0rxpPmNR9f+0CP3lwkZtCDXE/L6b/5O0fSt0utuu1C/sjA
         THSmpE3OKgi3KC0h5xxuwfC2g9xwgNzvvTWwDqbvoDBtrV5WL2v+ym8nA8x8Hy8ufuYP
         nfAFFIzHvtKRMI//dlNmsOEFinqng69z93Gwo5s8hfxCy/qP1C+4SPobq12gg6nK44Fj
         e7M25VhRlXgdxVmKem93+1abeXdEuVX4inexhZn2jG4r5bJ168Fhr1obFn2qiLVuDXIZ
         WWhUbm5WFuiR0E8f/3PcqwLqLJI0ezouiBKDluXHU6GYW8dogUO6z9YexevNlUZMXiPQ
         1D1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589803; x=1796194603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
        b=Ma0Xj8KyrbilR5ldE+wxNI7IcvPAEPAvDpczSsclFERYEpIQZ77/lo0e9/S2YOFVpY
         a7OMqj8/UoJ/WqImRsyPUlrA5WlssrBlZ8/apNEfWkbpG3XKyHgLXNI7tRlx6I+ZjOVa
         zSJKkhASUi9r6vTLMqBGF0iUwKsf/OzKilYdm8pKpOAc4OIOXX5MKt1uupLGgnzTZu4R
         gCV9Ttq31zxyFavCiwjfa8oZnXkCV46Ko3P7QdQ95FeBW58EX+FWS8nse2PlXNyJ33Hl
         bnwTN/BIRR1aCR//tqa8t7dUWaWSkf9FQUXXxCiN+CcFtCJtjY4ZaaSi+rm3vNhkEGgp
         05DQ==
X-Forwarded-Encrypted: i=1; AL+hErGHBJPtFfWawF7FR1Ntppf8w3v9UplrVOY8Dr9aZtj+TvLZvcRVbDnMdsYy5Sr6IWoGQpGQ/xAXnAa8q8+rPSye@lists.infradead.org
X-Gm-Message-State: APuU4Z+X8aZpxcNEF5xxlnpfVdJXsiBhMrrsTibZqARM2yMnhPK69pHh
	mSmCWSxA8TjQqPZ+5VEs2dX5SqZPB6PRFnLjzDlQ9l51uC0ryiohSQ3Vbei5D3cwqjtM9V3phzb
	+Y8umRAI=
X-Gm-Gg: AZFdTZfRxpIggy6Euaajme+kSHIc9vMwR9aNxakmSVGxE+RJShka1SXkJUlytfCDSey
	VKDhWwRsuK5GZYahYpANUovqR50ihN2Z7v2ggqfBRxe0UfIeJoC6bf571Bk1OLO6kr9bQ1hm3xf
	9bPibHigYKOZu3FrXUr9GzRQaUPqzL7qLhBPHi3Ezg2+CoOBxM4LAATVaCHfJRGL3jQDQDD7pyk
	mRTIbm+VDx6qTjSclV5BADR7sYJszeM9c/BXX4elynlpJYrfYjVwdUa7186wVsUd7YyX/m4Trl2
	U+vhGalMlmw0lNYekH34uE45Y9ZL5MzG+mRCVsyjsLQgyEAV4O3aykba+4oAamJ8OK6ECOo94tV
	bE1X2LvlmOUFMSueuJlyt6Nsj+ysWUtnbvYU0vS/9m0tMbUKvBm+8GwJtBnq5PQvBinJSNOpJQp
	VxRitUb+r0IFAY7aKKUBVwd1ooEuCE9b6g0Q3FQ/mi3zE+QF5Xxz2lT54f9sOf++8Ow0kSfA+7B
	zyny1EiTogm5hzK5NZ2rct0mr/zD5mYC6hwml1HGBr82DCuTO1kdzkYDc8Nxhh90lF29Gez/MTC
	TxY+w22IkM21gHdWrS0jkfhWFiUEU+9HboujdqZ9
X-Received: by 2002:adf:e00a:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4abb3a4d2camr23594315f8f.36.1795589803330;
        Tue, 24 Nov 2026 22:56:43 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm31864281f8f.10.2026.11.24.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:42 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:18 +0300
Subject: [PATCH v2 3/8] KVM: arm64: Discard a pending SError when resetting
 a vcpu
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-3-224689d8a764@pereq.eu>
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
X-CRM114-CacheID: sfid-20261124_225645_632419_F5E10615 
X-CRM114-Status: GOOD (  12.35  )
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

Resetting a vcpu with the KVM_ARM_VCPU_INIT ioctl keeps a pending
SError.  We used to rely on vcpu_reset_hcr() to clear the SError but
commit f1ff3fc5209a ("KVM: arm64: unify code to prepare traps") changed
it to only reset HCR_EL2 before the vcpu's very first KVM_RUN.

If we reboot a guest while there is a pending SError then KVM delivers
it to the freshly booted guest.

Clear HCR_EL2.VSE in kvm_reset_vcpu().

Fixes: f1ff3fc5209a ("KVM: arm64: unify code to prepare traps")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 9c1b42890c96..a5d298d5ce61 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -207,6 +207,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	/* Reset system registers */
 	kvm_reset_sys_regs(vcpu);
 
+	/* Discard a pending SError */
+	vcpu->arch.hcr_el2 &= ~HCR_EL2_VSE;
+
 	/*
 	 * Additional reset state handling that PSCI may have imposed on us.
 	 * Must be done after all the sys_reg reset.

-- 
2.53.0


