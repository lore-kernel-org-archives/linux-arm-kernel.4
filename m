Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E8C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tu1Rxmza;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Cz9JAfUU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/z7BAnG7MZSAVYRW5pPZLxA05bNqQ3NUtrJbGTCFDWo=; b=Tu1RxmzaLHSEeE
	j5UsuVFcx4oN0w7L5YeijPGLo+NqIddwzilRkEb1Fj1tTaRlQ6UUjIBJuW1uQuTl65IxA1hs5Ehu+
	4xC9sLNEnsCQLuY2lL7jprWMQ//O/Omicv8V4OoF71GwKyId8noLoSbnh+VkaANghCKx2dnOJLjlK
	DodjD99iUZCye0c9fi4zfmwphxDObvjFyeBZHLtmbatlTOhSII4Vsz+M+FNzYNTDIFfhZDRreqUAO
	LVkF52YGVKPNBK6XRECh466YO8/fjfsFBil/qvyavBpriRAOFyhBd4dSSS5JKovUxn2qBGCQtCl+M
	EFInReJwzwU1RIsJ5hSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyPf-0000000BOdn-2Dh9;
	Thu, 19 Nov 2026 09:26:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyPc-0000000BOdI-3dWO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:26:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 584BB1A170C;
	Thu, 19 Nov 2026 09:26:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24B5B60237;
	Thu, 19 Nov 2026 09:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 372E711BC1FF7;
	Thu, 19 Nov 2026 10:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795080390; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/z7BAnG7MZSAVYRW5pPZLxA05bNqQ3NUtrJbGTCFDWo=;
	b=Cz9JAfUU7IyztCLVofDhmCUhQWcGYKI0HmupitglhbNt8Ay4Hkm7G7BPIhHVA7mPmGRq2v
	v4OnXjpy1WnIdP/JLgPuWvD/0AwiaPVh5aDImotDmfmllARdNxV/SPL/bofqQCLjBeInU0
	cQsFdO6gPvZL9sGKVITTIMM7PM9eawYPD0Pv1YN9a318KmLJ5cBh/310lntmvKo2ztuvxk
	e3eVpzS877O1iX5V9BLJkufMaChuJ0PCpsohkpmc5D/nHpdAlqJRxHNyDtlp3nHAJCnZl4
	C/o5UdXRbPnrR1sqQ1n6zlz0jMFt5wEGsJ82bVVsD3xO52hZXOtZj1ECCFpsFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu <ray.liu@airoha.com>,
  Mark Brown <broonie@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: airoha: Explicitly prevent continuous reads
In-Reply-To: <37fc133b-a5f3-4b4d-ba2a-002239bbcebc@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Wed, 18 Nov 2026 21:37:21 +0300")
References: <20261118-winbond-upstreaming-airoha-cont-read-v1-1-acc0b6410868@bootlin.com>
	<37fc133b-a5f3-4b4d-ba2a-002239bbcebc@iopsys.eu>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 10:26:26 +0100
Message-ID: <87h5hdf9z1.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012637_065397_9893ADF7 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Mikhail,

On 18/11/2026 at 21:37:21 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> Hello Miquel,
>
> I think the patch is bad for the following reasons:
> * As I know there is no CS issue with Airoha controller. It works properl=
y.
> * Airoha controller supports large reads (but only in PIO=C2=A0 mode). Th=
us
> =C2=A0 continuous reading may work properly. Unfortunately PIO reading se=
veral
> =C2=A0 times slower than DMA reading.
> * DMA reading is much faster, but can't be used for continuous reading.
> =C2=A0 Maximum transfer size is 8191 bytes.
>
> Thus for new Airoha controllers (en7523, an7581 and newer) it's better do
> not use continuous reading and read pages using DMA. Old controllers (like
> en7512) does not support DMA, so they can benefit from continuous mode
> reading.

I had understood that the problem was CS handling. Therefore, the
approach proposed here is not a good solution, let's drop that patch.

Thanks for the feedback,
Miqu=C3=A8l

