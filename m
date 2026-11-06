Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6382D606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t6YsK4rf;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y+ng2dEd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ofV2qVpqrfBMyd1/zLMm6/WPtcgEV4myUPpyNdz12kw=; b=t6YsK4rfQ1xak6AbLaynLO8JX9
	DgHvOiUEWz9z4s5FsbH1PBmv2Zdrl79LvUa13Mxm720ZW8JJIdsP35bUMyM7woxkK+V2FPLilmLXZ
	GjG3xkc3dO0n34m3QIJaj7Yy7MI5QqQDSbc9hzYAV7I98RnY6MMHhFZ78NODXVwNDbOPapndoVbGt
	FB2wHFFSDBuL3J05wpVnQ+dxwcVd/MapNGYZ69toS3Nv3Mm3RH/ev43iRa5blx9gWov/R6Zpw8tPF
	lFVXuVKXdwarNIuUbba9k3c13El/w+7i0g2t0BRsLTK1Rd7R/mXkzXYUI2jyKI2duZGcJ5rDoyVxg
	Rtp2IfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLzc-0000000Cqog-051B;
	Fri, 06 Nov 2026 15:36:40 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLzR-0000000Cqfh-2Yvh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:36:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ofV2qVpqrfBMyd1/zLMm6/WPtcgEV4myUPpyNdz12kw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793979387; v=1; x=1794584187;
 b=Y+ng2dEdi+zky1s1Z1rLDGIGS++Hq+vKQzVnVV3Bm7feiPr8ZGdEVZLuhGimil0MsxeWJdku
 Wv8tzSO6ymkaR2N6WAWSeB+tJL2H2bE8EjQI59BI4tuYJoXNOvchg1zOnOcmtfqtnen4V3tmW5z
 gLZx9KfuxZJeOA7j0GJZGBC4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0904f5dca69a2a72;
	Fri, 06 Nov 2026 15:36:27 +0000
X-Mizu-Trace-ID: 0904f5dca69a2a72
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bff701efa5so790e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 07:36:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwFof8fHHScvxrWnolSwHPUiUuz3NHAkiM2QgKTZOkjjI8I6I7ob0fXpqydhbuYt31oUuO6b9NKu2p/tpAoFNyc@lists.infradead.org
X-Gm-Message-State: APuU4Z/gRtiQ631WOBqNabcWh1ibk22+0lS9uuzTRU0brdxPTIBpZrUu
	BFKxq747tzcRafVB3NdCHBzxY2si0dJW5dqTnCZDHjAdqyYfXTWqdA8eno3o7mGdhy7KwXprmDn
	R0WCsUK6slXbfVypcEiMUrfxDdKMjeZ2gaf04Ybg8
X-Received: by 2002:a05:6512:1056:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c00a413bc5mr6933e87.10.1793979382196; Fri, 06 Nov 2026
 07:36:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104084842.132944-1-fuad.tabba@linux.dev> <20261104084842.132944-7-fuad.tabba@linux.dev>
 <au3pNFOMeIx2X4Dp@e143914.arm.com>
In-Reply-To: <au3pNFOMeIx2X4Dp@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 15:35:45 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwMv8NZvTy2cVtGRLoHxABZiv7yYUdRBHE69ieFUxoRXQ@mail.gmail.com>
X-Gm-Features: AclHuK_ZZQXxaDxpRQHq7T9rnG0s3OxixfWJ81iGmmqdPNJp-0OMdSXL2rZvnds
Message-ID: <CA+EHjTwMv8NZvTy2cVtGRLoHxABZiv7yYUdRBHE69ieFUxoRXQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] KVM: arm64: selftests: Add protected-VM library helpers
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073629_801920_CA1BEB7D 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 at 14:50, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> One minor thing below, that could be addressed or not.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks!

[...]

> > +void pkvm_run_loop(struct kvm_vcpu *vcpu, void (*on_sync)(struct kvm_vcpu *vcpu, struct ucall *uc));
> > +size_t pkvm_host_locked_vm(void);
> > +
>
> Could add a comment here:
>
> // Called from the guest
>
> As you have those 'Call' / contract comments above.

Ack.

Cheers,
/fuad

