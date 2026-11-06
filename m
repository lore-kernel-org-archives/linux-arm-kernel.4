Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NbIrDIeN;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A+qPZ9qe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+gyzgNhPsylvP06vZq5Elrbi2P3u4np1Q6XcqS10pRQ=; b=NbIrDIeNuORsZS
	WvfWWoWyFHwzucKipJUZ39KGhvywOTe+3fg/lnN5e1a9c3pSjcb9Aht8vtmhkP46jqVihQb87lhJi
	DPRNwiMyvfc0GVTwClSt0JIIUXZCR1Fw2L1vrFDrIrGNzaNecrd8qoTMMRu2uSHX5j8odfm2I98x2
	ePTMBRzwXSxPq7gRcKdbtgEh3FXdnb4LjK7/VIw40OY/JbTyvRSnyPv7wyguCJxnQEfj4HH2M4Qe3
	+I3sFVSE9TvNtrM0peCBNxvaq3x+9Qgnc7hTFtTo4fCpMTtn8s85XRQhVnvkJvpn/cnBwMZIvUOi5
	Hmhaksc3BU+MYZkHG62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPT2Q-0000000DpBw-2N8Y;
	Fri, 06 Nov 2026 23:08:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPT2M-0000000DpBJ-3Kcj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:08:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE1B11650;
	Fri,  6 Nov 2026 15:07:53 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D216E3F632;
	Fri,  6 Nov 2026 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794006476; bh=RJP+8WlqG/AN8bbXr0dcvH9Qfm+ONJlgtpsBrXaYgLk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A+qPZ9qeYrog5H0PV6WbMfxCMDh5jvpniOk24HubukGL/m5QIsiHJKgayOMaz+FGW
	 Kalpy6nnQROAErDm9Zk63zkruft/Zrg7oBdens2LnteHYp03qOBaDC4va0axjK3OJc
	 OGBxNk0eVUlHwUlF/0U98vTxcm2KOfheIRTFd85U=
Date: Sat, 7 Nov 2026 00:07:45 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: krzk@kernel.org, Ulf Hansson <ulfh@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Ripard <mripard@kernel.org>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu
 <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC
 controller
Message-ID: <20261107000745.45b349d1@ryzen.lan>
In-Reply-To: <20261103-a733-mmc3-withdraw-reply@gmail.com>
References: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com>
	<20261102-steady-grateful-chimera-e2363a@quoll>
	<20261103-a733-mmc3-withdraw-reply@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_150758_963162_43DEAE4E 
X-CRM114-Status: GOOD (  25.06  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  2 Nov 2026 19:41:55 -0500
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

Hi,

> Hi Krzysztof,
>=20
> On Mon, Nov 02, 2026 at 08:27:19AM +0100, Krzysztof Kozlowski wrote:
> > On Fri, Oct 30, 2026 at 10:26:47PM -0400, Enzo Adriano wrote:
> >> AI assistance: Codex:gpt-6-astra.
> >
> > Drop, we do not advertise slop companies anymore.
> >
> >>
> >> Assisted-by: LLM
> > Drop
>=20
> Will do, here and in my other patches.
>=20
> >> This binding is a separate prerequisite for the disabled MMC3 node in
> >
> > How this can be a separate prerequisite? Binding without user is not a
> > prerequisite.
>=20
> You're right, it isn't. It should not have been posted apart from its
> user.
>=20
> >> the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
> >> operational eMMC path.
> >
> > Hm? Why?
>=20
> Because I can't test one. None of my three Cubie A7S boards detects an
> eMMC, and their vendor device trees leave this controller disabled.
>=20
> [...]
>=20
> >> prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
> >
> > So this cannot really be tested.
>=20
> Agreed. Those IDs came from my local tree and are no use to anyone else.
>=20
> I'm withdrawing this patch. Andr=C3=A9, you asked for the other MMC
> controllers because the IP is the same, but the manual documents a
> different descriptor layout for SMHC3 (A733 User Manual v1.00, tables
> 11-3 to 11-6), and I have no hardware to test it on. The next DT
> revision will describe MMC0-2 and leave SMHC3 out until someone can test
> driver support. If either of you would rather have it described now,
> tell me and I'll put it back, in the same series as its user.

Well, I was merely asking to list all instances that are the same. That
one MMC controller is using a different IP is new, so I wasn't aware of
that.
And we don't submit bindings for something that has no driver and
hasn't been tested. We have been bitten by subtle mistakes in the past,
which lead to broken bindings, so just wait until we have some user for
that. Adding to a binding and DT is always fine to do later.

Cheers,
Andre


>=20
> Sorry for the noise.
>=20
> Best regards,
> Enzo
>=20


