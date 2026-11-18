Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8267606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ub7ytdpr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZGNmggXu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ji0Sy7yk69gklaMPP5Zc2g+qgmHVYq7bGDR02Mw+y7w=; b=ub7ytdpr/GuG1FZBiqKBCT6rko
	RvDmlI8Ce4YGRVS2kkrQgdlnOXY1GWzV1kUar6mfQVyCKkQvxQPOSWcbtk8AnAkR9pPgbKqg3YuO7
	uDyPwfjNc4R1EYsIjOL2ikV/3QUVvDJFmBgiK2HlVWUq17g4xOuznLwPuNAbfnBb2gOMn3cSj5kxt
	AuhWGwMvB2Xb6v2BU69QmRd6MnVpLY43D9dcbqV20voympnvsdKCrlfoPnUrx7V6/I+GGU8xIA8nn
	AmLqfmctUPCB3moitUDapI754VMAnJRPsekyXcwRtwgc+of02SyhuRGcZmgdjApVylcNwSJcEUtdS
	x0m1vbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdN0-00000008ebk-24cJ;
	Wed, 18 Nov 2026 10:58:30 +0000
Received: from out-132.mta0.migadu.com ([2001:41d0:1004:224b::84] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdMx-00000008eb0-0baI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:58:28 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ji0Sy7yk69gklaMPP5Zc2g+qgmHVYq7bGDR02Mw+y7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794999504; v=1; x=1795604304;
 b=ZGNmggXurR8lJiCivOFgmm9zGexE/Sc3Ef9Jh96Ssyl8lUqutCToLMG+RiH2QetOo0eOI/LO
 e4pKhpPwjqABMTV5Kl3HChUqpqSa+a1C82KpZECRDuYHye7CR1FKR7VVObanxhd2A11GZJeI2N7
 5572+hQFtAIS7mZAFg7GirF0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 84462eb013302327;
	Wed, 18 Nov 2026 10:58:24 +0000
X-Mizu-Trace-ID: 84462eb013302327
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5332e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:58:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFYZrJmq+u1dbEnbN7fZ0djOeOJDK40tZ4fBdGD2ZuIQLBRGAuoNrFTiKUXL/uKnQxSAc6D2/suvEoHkoiNu78H@lists.infradead.org
X-Gm-Message-State: APuU4Z8M03mOEW3UF99y5Rly1sBBXZuWkJuYD85+KdZbdFs0b4OiuY1v
	dPAJ9Gwde0ndvRq1/vV6dBw1MZu1dMoZ63IgFl4Dc82rJTAlnHjcU403NirmVLIai/3jUN/+rCG
	pK+CuYx9GXPoirXo/IjorwPd5UZzoZhz4/oYBoqsQ
X-Received: by 2002:a05:6512:2346:b0:5c1:6e17:16fc with SMTP id
 2adb3069b0e04-5c1a985f78cmr169644e87.2.1794999499497; Wed, 18 Nov 2026
 02:58:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev> <20261109084854.840576-2-fuad.tabba@linux.dev>
 <86bj7n1bzx.wl-maz@kernel.org> <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
 <867bia1kab.wl-maz@kernel.org>
In-Reply-To: <867bia1kab.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 18 Nov 2026 10:57:43 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxMVXR11s5_U5144hdpYStkd1-gi1P2HK6DLnn5D4RW8Q@mail.gmail.com>
X-Gm-Features: AclHuK8nMc23WqG7bzjhLPz1LETcOHXAsv2Kso31Kz9QH-6JXZhmhiORkbvHHMI
Message-ID: <CA+EHjTxMVXR11s5_U5144hdpYStkd1-gi1P2HK6DLnn5D4RW8Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected
 VMs without ptrauth
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_025827_321507_B4F56BB8 
X-CRM114-Status: GOOD (  13.16  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 at 10:55, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > It's in this one because pkvm_id_regs depends on it. The test checks
> > that GPA and GPI read 0 in a protected VM without ptrauth, and it
> > fails without the fix.
>
> But that's a *test*. Nobody runs tests as a production workload.
> Delaying a fix to satisfy testing makes no sense to me. If someone
> screams that their tests are failing, let them scream, safe in the
> knowledge that you have fixed the problem rather than the symptom.

Ack.

> > Would you prefer that I send it on its own, or with the respin of the
> > features series?
>
> I'll cherry-pick it directly.

Thanks Marc,
/fuad

