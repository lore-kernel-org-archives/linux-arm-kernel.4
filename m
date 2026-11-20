Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B350606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LBclKazW;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ov692Pih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=; b=LBclKazWOpdc8HLwEin7jm0/5A
	ClG/X3OwZAJTtKAVSpd4X7EAY3PjA2LhKS0XL7Rek6yZYYASLu4yn/R5akhmcUEuN7yPUIAaU6sAh
	0x/CboA8L1SFneAqRUdOI6zL81GDl6emP8R1WJ47KzjpE9cD6flCFzeHWEWXCXvmLPg4gWfZb6/yw
	EPdVBtFfaM300M5+w4jId0b4PPVm0xKDT/uk6HwohlcwZRJi637iHjwoWZgbz0uMYI6IPr+nihg1c
	35AKNPvNERmK+436pV1Cd4XikQBQUyUvr/IGXZsCziMdTYoSi0Ky/tfC9aBkJFwC1LIMP1lIYoccQ
	Ezp3//XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQHH-0000000FMwQ-3Ca9;
	Fri, 20 Nov 2026 15:11:51 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQHF-0000000FMvq-1wJk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:11:50 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c50547b4992so84283666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795187507; x=1795792307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
        b=Ov692PihT0oiDVOjs1aZQ7NWj7MRknXHpffYiU5Yd3MX1VM9FyDviYXh0DI3+l2B8a
         Ukelwhm9q5Mk02rqmceWAAoybLo2BtSVAE9VdVi30IcDYxR0q7EuIP4v5VPDq2dIW4ex
         dgcv8mzghTU1XsFBiRJ0VvmtNaeeh0U7RB/hD07VbuspCS/Jvs77NpLdDSswthYLaLx6
         DWBB3uG/l/ZmG7zn3/uvB6npzhnRSft8YS0SbeiIPMyMGbYSUBW5Ve49QCkhpPM3LJap
         y2SoxGbxHpCakCBTZrwagu7gj74YPWGOJMVBxXnHWsHOl189etny8h9lzF7UcTo5qX/J
         8u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187507; x=1795792307;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
        b=SPJb1oooKWqACXxT876msxx41lTs2HYNkZNIjS5nGgPwAti7AC7k8U9mP0oh6H8CSR
         aGoHzfjGmysADBp5QRRARfxPFlV6yO8KJjojdUJfUT6MGqjuSJaWbrGvm0lik+5Vm2BF
         Q6ARVIR/1McV/wHGr17FChieXwvacWxH2CjKU/MArr6/ZoxVWP9xlC2zqfy+dBcEzJR4
         Tzhr8aI18hZBT3YY4z3t4CdJDYjqBQ6qMa8tZAjBhN81H2eEcwtPNcZAjkwqi9cxOPZ4
         ajMrIm2hkUZr5SsYskp1CjKD6zKOlGu5bosduoasq1EwF5Zvq/jTFLuhN25XFCQ5gT4l
         YcIQ==
X-Forwarded-Encrypted: i=1; AL+hErECCHVplLJxE2YCUM6nHY/97T+tQOCuFtq2mSAgoxdbczDE5Rh3hCuFiTn83LPmsXrXQTpSeafpV4Wpr8S+l0TW@lists.infradead.org
X-Gm-Message-State: APuU4Z8rDfn8Bg40bitMWkBYxRrEoAfc2ET0LiAp3GNcNsrC1g6UoTyK
	KbgzsABjx/KARaWOA58dJgfe8jiiwfQ2VCfdsGuHc8ZC4pa1+DUqSD48RSN+TFOcksx31L9aKuG
	LmGIBTjkuYw==
X-Received: from ejnw20.prod.google.com ([2002:a17:906:52d4:b0:c46:7c51:47a0])
 (user=stefion job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:69ca:b0:c50:f024:5219
 with SMTP id a640c23a62f3a-c513ab48468mr252861866b.40.1795187506339; Fri, 20
 Nov 2026 07:11:46 -0800 (PST)
Date: Fri, 20 Nov 2026 15:11:14 +0000
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120151114.3708208-1-stefion@google.com>
Subject: Re: [PATCH v2 00/19] KVM: arm64: selftests: Tests for protected VMs
From: "=?UTF-8?q?=C8=98tefania=20Ion?=" <stefion@google.com>
To: fuad.tabba@linux.dev
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, 
	qperret@google.com, seanjc@google.com, seiden@linux.ibm.com, shuah@kernel.org, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, 
	"=?UTF-8?q?=C8=98tefania=20Ion?=" <stefion@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_071149_624435_EB551719 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

Tested this series on top of v7.4-rc1 under QEMU TCG (-M virt,
virtualization=3Don,gic-version=3D3 -cpu max -smp 4), booted with
kvm-arm.mode=3Dprotected (protected hVHE mode).

- All pkvm_* selftests pass. The only skips are the self-hosted debug
  (breakpoint, watchpoint, single-step) and SVE cases, which pKVM
  doesn't expose to protected guests.
- pkvm_id_regs fails with patch 1 reverted and passes with it applied.
- Each patch builds individually.

Tested-by: =C8=98tefania Ion <stefion@google.com>

Thanks,
=C8=98tefania

