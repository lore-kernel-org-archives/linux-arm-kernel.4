Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0g4EOR6n;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FCNxMS1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+DQj5Rd8zqu4HARCi8rW0yj9HPFCT3iadFhwoSDGLHw=; b=0g4EOR6nVWtZt/cgyliKP/nGyC
	LidAbH8GSazFm5cqUvQnhREeM28bb1oiNj05ohm4QMPgm+sSPfbhSmPjYxZzhJrpPkowtGsareMfy
	InmtWVU1t639UvT4R8dZYlZSWuyLPNxs4PMOYdAxHTMtie7j0V4g8mt5javVCbAPl6df0rgxuHfYZ
	fx5/kvvmC2/0l9w6B7H3NXFmAlnVjYre9Trwut6zNK3drWDqpknvvf/9QZQCNr8sEYQ45igt1lvif
	J+97VB8MsvTb4l4Pr9m384J5fT8kJnDCMsUerIiiRHUFiBBSaFWTIit5wD40tmLT5l+Vv0Oqf/JJy
	s+Adqm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOqN-00000006sw8-0V2B;
	Tue, 17 Nov 2026 19:27:51 +0000
Received: from out-73.mta1.migadu.com ([95.215.58.73] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOqJ-00000006svC-3bCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:27:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dKmJYX/63y+iQ1pYCnW01HTy/TWczwm2xVh0zs98/fA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794943665; v=1; x=1795548465;
 b=FCNxMS1+O1fZUVoqO+8hBDbYTalQFDhh+55jfHDON8Hs9nx+LNPzsJ/bAUWcifrMKOeYGB6m
 j/yQdJvKrf3NE32L29QR3Mi7RhSQl40el38qU0plS8V51Ky4RQpHsOio55YLt0ub+4SnnWkXsh/
 ppjsreX/wojyE828CJLaAFok=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b544e24a45915dc6;
	Tue, 17 Nov 2026 19:27:45 +0000
X-Mizu-Trace-ID: b544e24a45915dc6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so1130e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:27:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFwxRZBf01SeZyhRaEVQYYotpA4btAqtTvO8RDPgFEF7aik2vq7dBvkacknNIx4ZNB8wr2GWlelG2sZk9O93dfx@lists.infradead.org
X-Gm-Message-State: APuU4Z86iDsAh1pfaLRt4t7IZJ3Q5ILK7UvHUioAfIsnJqI8AcRTCU2K
	XqotGQ2eJn4Q9HR2c7VMexBNd96s4KlVBEPAFKeo8h3pmn+1zSlHcJRAL8yqW9dkcbgqvIbXtOA
	5xITxzTCyBMeQm2wTdt+S3s1nAMZF/g3mZbclLILs
X-Received: by 2002:a05:6512:304d:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c1a98e431bmr17685e87.10.1794943664222; Tue, 17 Nov 2026
 11:27:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109083205.806619-1-fuad.tabba@linux.dev> <20261109083205.806619-8-fuad.tabba@linux.dev>
 <avyZH2g3rrIVm-Fl@kernel.org>
In-Reply-To: <avyZH2g3rrIVm-Fl@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 17 Nov 2026 19:27:07 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxsZFOwT5O5FfMf3wcTWrydR+x1TYVRDaCEF_FQX8giFw@mail.gmail.com>
X-Gm-Features: AclHuK_6wbUaiI-auzUUbuozU8SjWYXkCa76KeN8iu8Ffe01iC2J030eQ3Qa2QI
Message-ID: <CA+EHjTxsZFOwT5O5FfMf3wcTWrydR+x1TYVRDaCEF_FQX8giFw@mail.gmail.com>
Subject: Re: [PATCH 07/16] KVM: arm64: Compute a protected vCPU's fine-grained
 traps at EL2
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_112748_524973_8F9DB330 
X-CRM114-Status: GOOD (  11.81  )
X-Spam-Score: -2.8 (--)
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

Hi Oliver,

On Tue, 17 Nov 2026 18:12:47 +0000, Oliver Upton <oupton@kernel.org> wrote:
[...]
> > +#ifndef __KVM_NVHE_HYPERVISOR__
> >  static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
> >                    int map_size, u64 resx, const char *str)
> >  {
[...]
> > +#endif
>
> We already have too much ifdeffery... It isn't mentioned in the
> changelog but I take it you're doing this to avoid the printk() in
> check_feat_map()?
>
> If yes then just upgrade that thing to a WARN() and carry on, it only
> ever runs at init.

Yes, it's because of the kvm_err(), as printk() isn't available in the
hyp object. WARN() calls __warn_printk(), which isn't available there
either. WARN_ON() works, so I'll use that in v2 and drop the ifdef.
The warning won't have the register's name or the bits, though.

I'll wait until next week before respinning, in case you or others
have more feedback.

Cheers,
/fuad

