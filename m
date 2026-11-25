Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E702E606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eeBYGICI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=k/jEVpVv;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=I+Y/BRNS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1gk2zDY+qHFoLpfFOUqPZn9pkTFPLdiycG87z3EJLfY=; b=eeBYGICIU2C6RN
	pNkf2sO04uzcNPZD7s9IWN+tl9QzKPbg1Zf+cqHf1+YGJiAjdmI6lCidr1EjFM7hcLoGL4OLmAsL4
	agSf7UEAbF+qvOJEsejZWjSbNLTXzyRA7L1l5yfAWhPgeR8NQ6v5HOiKd9ZgJc0GnRFNM2bkJNtRY
	lTX008m9lTH7RXEMbc2LqO+KlUSh7v27T5LuL8r8zX6C7giFwLi4Ml1EKgmUu9VHd4HblFVoyL+HE
	tqTT6dpHMQiouyEtbLnIg7RsEFjAMN0c0au27LsLA+9a7KyqDPyORVI/8EncdIiumyst/FNNUWcio
	sKn52eH41ap4i+Zc3hfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6j2-00000008jc6-3622;
	Wed, 25 Nov 2026 06:43:28 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6j0-00000008jbN-1emi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:43:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795588973; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cTnbBPeGovHeLT6q6u9ZQyfIcEbHxmGIT0GrghPBSMc0a8wnvXLtuQfkzrUkZuOig+
    mjlrb2X9BAMV6Niob3O8lWaPpn0e2SdWNdjNmOniwDiCZzqNRfWlUcROWNXaHY5Ve/NY
    0VtyS2euhWucTcYnwTYon1YrmlfKfZqLYxa+qOPkv3sBr3ecSeQhrjCD2A5z9j+paM+0
    rVWwnW9u+e0WtxWUhTDMffhkDAndZfl9WrnAH8ZAPV4eKb9fiwp9k208ODbrRSGsbdsg
    j3/FNSbgbwldCxxsf4/oW8ZuSQ7/5LhlEuJLh16CY1sXuLGDgGTwZ6sZYN9iz1IICxLH
    BmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795588973;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=1gk2zDY+qHFoLpfFOUqPZn9pkTFPLdiycG87z3EJLfY=;
    b=VnsemKLEMl+3O0YMCi8sFARtWux1a17AXnxlzhRywNWKFcfap3DH7difiJlRoGytYh
    0lOcJWFo7zxhNwp1yt3/yyQ6N4YsfMUGObwXOKvs4A5PTFMk0fIug+tCVkPz4A//bvId
    jxdtI+t8tUjP1cM0OjQcUc+7LTkHs2scm9F9oIOZetWaErP1jEVAIELCzO4t4KbALYLi
    Jw1E1xmzK3Oiz6FwxQ41LBe7+tDd3B01/ZH1FJL1A+y8qC+R7qsqDEMYTgrNAZPhKyf8
    RLLci93fYIazcGHZ3aHRYdTRVHq/Ax90aMZHWEnskYt5wjVw9tE+H9/kWGZsWXKRGccY
    5LLg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795588973;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=1gk2zDY+qHFoLpfFOUqPZn9pkTFPLdiycG87z3EJLfY=;
    b=k/jEVpVvLQkIML9nalg1JpMqB9CTqv/wAXr1zhqxzs/o7JG9ou3ERFGcSh+GlbUNZn
    3tq85SddEbKil5B7cchZLZTrAwFexsBaMs9qsmh1iCRlQ1k6fHzxw0ptVxAI3mTDKdQL
    4FxIaWJCkEHW4UASXFZnhxLqQn7CtpEwLzx6WyFXmsohzLa/KHGYS/rke0TQqo4/JxkA
    jdfdPQTfKFoLe7ntolGx8485ObKLaY/+bpykLMy52JLbu3wYhBttQ1/RFXnt/tLR18T6
    beJ+5cYvFYqR4grNQ3iFfE1hMjcMvNNuRfSugQ0WE2Fjb766Bf/tfXpjfxJEV5n02c70
    dlsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795588973;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=1gk2zDY+qHFoLpfFOUqPZn9pkTFPLdiycG87z3EJLfY=;
    b=I+Y/BRNSdG/pLdf5zxxzQco0G17o3kqUXrsy6r9rvniFtpueTu2DVpyc8o6OxvGsQI
    iHXykzGIK8KtXwVBJmDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AP6go5ny
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 07:42:50 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.11\))
Subject: Re: [Letux-kernel] [PATCH v2 00/20] ARM: omap3: pandora: Modernize
 audio and backlight to use Device Tree to finally remove pdata-quirks
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261124234143.4f099646@kemnade.info>
Date: Wed, 25 Nov 2026 07:42:19 +0100
Cc: linux-fbdev@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 linux-pwm@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 David Airlie <airlied@gmail.com>,
 linux-leds@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Helge Deller <deller@gmx.de>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Daniel Thompson <danielt@kernel.org>,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Roger Quadros <rogerq@kernel.org>,
 linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@pyra-handheld.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D4A9EE97-468E-4720-8D26-D3B008F8E762@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
 <20261124151318.GA536798-robh@kernel.org>
 <1DCFB59E-E5EA-4470-997E-EAA4ED35D906@goldelico.com>
 <20261124234143.4f099646@kemnade.info>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3826.700.81.1.11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_224326_695682_83FDEBC4 
X-CRM114-Status: GOOD (  20.94  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andreas,

> Am 24.11.2026 um 23:41 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Tue, 24 Nov 2026 16:27:16 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>>> Surely=20
>>> this can be broken up into smaller series? =20
>>=20
>> Yes it (we?) can. It is just a question how to do it and properly =
describe
>> the dependencies to avoid bisectability problems and avoid that the =
final
>> goal is lost.
>>=20
> I think it is indeed tricky, and probably induces delays.
> You can point to the pandora_bl driver  resp the pandora sound card to =
show the
> final goal.=20
>=20
> If I understand it correctly,  you have
>=20
> 1. preparations/extensions for using the standard pwm backlight.
> 2. REGEN stuff to wire up the power supply.=20
> 3. dts changes to wire up backlight and its power supply.=20
> 4. sound: quirks in twl4030 codec
> 5. sound: dt conversion of the sound card.
> 6. dts changes to wire up sound card and its power supply
> 7. machine quirk cleanup

Basically yes.

>=20
> So what brings it all together: the power supply requirments,
> so both backlight and sound depend on 2.
>=20
> Maybe it is an idea to split this into a set of
>=20
> One patchset for
> 7a. machine quirk conditionally depending on available compatible
> 2.
> 1.
> 3.
> Each can go into their individual trees.
> 3. might to in the next release cycle after 7a, 2. 1.
>=20
> A second patchset sent after 3 is in -next, containg
> 4.
> 5.
> 6.

>=20
> A third:
> 7b: remove quirk + pandora_bl

Yes, this is a good approach. I am currently checking if the =
series-scheme
can be simplified even more to help everybody.

BR and thanks,
Nikolaus=

