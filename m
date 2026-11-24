Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n5KJFgmv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TBq3Zp9F;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=9K1WvYtz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pPC4o0FashGrZ7q1ba6XFZ2dyTINKWWF8cNcwGutazw=; b=n5KJFgmv9S3lGj
	ozdAfcjW9xCzt+s37XoRCWPJUn0rFxNVfZTQ61tC+wGEyufLydYJlkw0Mi4QaBCZbnlRTvCuYi0La
	iB/ZnVFet1K6zYCSdY0igL++8CkVNdut6+Zu8hEHR8PP/lhDuT7aGlbTc2kvpdDHYBFLFzOqrzIHW
	XeQiJMJ8Sbw0JJ3OD5nJzbWk7BKl8LUkRN0ixlvHTlv8iKAjo299k8SLVWTHn0rq3YTcXcbq11hdi
	g777XfqMWVYnbMOOtwLcv3DWjnIZhCCE4txmBl0m3H8PT9nK1SRUGOGROW0uFo3dAUWCImJk2CU14
	ViJYQRScPHb+mKGE2EMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrbY-00000006mMF-24iK;
	Tue, 24 Nov 2026 14:34:44 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrbR-00000006mHY-0v1c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795530855; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VQiaI5Hy157VlrRqaOCj1N9vjjVa8Ra0JmiNp7xaIASjJ9jINXJ0n3OKdnYSQRp4JZ
    +EShQjRUhHzrJZJ7sL5P8n0r04fvc5f1n+yoXkQddn7xVATA1/TZ9th/4PZ+vlVxqbIl
    jpmPK15kaGe7+/0/dlIzlo2RhAcQfaFGmdEojwWa9EcecaXzd8JzT45K+ugKPNxYCY2I
    rnOPo4AX4UK8cKxWYfqEhoTC2FIWfD1ka/Ateg8XoQTc7pADiw/BrgJD9c3LYwJSkNjX
    3JocLaQ7E0IzmGCQsTZqvzi1MU/Oy7HoHzw5ysEoEsjpY5pMiLsP9n43mrM2dq7EfYiQ
    PoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795530855;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pPC4o0FashGrZ7q1ba6XFZ2dyTINKWWF8cNcwGutazw=;
    b=H1naZhooZrS8f4XAxSxLXUg4qjedYo56i3dz4xniKf7PkDMMjT/O1xgSSh9pfgr4pS
    RFaYBeA2pNvx6TjrzltkUhOW7nU34meCf3mdle70hKq/e+sMBfvnJL5nfk+s5JF0bOna
    F5tgYYVwgBLjH8a/kqlIKwsIqVii7+hqZwRjgzP11d1zIiOv/wtvdZez3yuLiTf3YWAg
    7uXrxSe9FyH9wM6WMDcMENrz8D1ktfCFFP4qkCT+/lgv+mO27fL3zIMZxH+PgOZcHrWy
    TV+UI924lerakwwjDWZ5PhvjFulKtvt3MAylYXdCPVn9WjoDEy7M99Y5Vll7+TYdrztB
    ElIQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795530855;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pPC4o0FashGrZ7q1ba6XFZ2dyTINKWWF8cNcwGutazw=;
    b=TBq3Zp9FVBdC07XCYxWQJdKxG6KJ26CqiOTO1TaNSfuZPKB7l6tlkfjJCkcYX/bzxN
    NzC6pX1L6sq8PzgPHNP+VfBSLIv+4n8QXwCH5OmFQY7o6YOKs6xKFKPkDhMka5utJ6Tg
    lrAAIHPZmZmnqAMFPo19GWniCdao68N1O6rerqOFE6VjphVxTNb+MiMGp8ZZK0J6BvUB
    nUYNTZrX7gzhEqMlVtFWrjqRQR2iqJWiQr29ymQeF4e2rXp+rZD0vaRApCBvz3aso0gh
    Rhf3vkl868bsKQJ9S6UY5Tr7hLY9BJp5YU9ukW02eQnC6EiisrjxWy8CIIXFRWY0OxAh
    B9hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795530855;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pPC4o0FashGrZ7q1ba6XFZ2dyTINKWWF8cNcwGutazw=;
    b=9K1WvYtzJzNNHClBs+8Vddpi1CzZaNt4JUc5jRlbRw8+zB//G65L//AA5d5KzafPpj
    z8iD9e13OeegkV32RYAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVWUgMvoVkTTR2P7jtjQyY2AeEP/F"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AOEYD3aL
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 15:34:13 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.11\))
Subject: Re: [Letux-kernel] [PATCH v2 04/20] dt-bindings: sound: pcm1754:
 Describe PCM1773
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <608d13a4-6634-406e-aba8-b48114895cc0@sirena.org.uk>
Date: Tue, 24 Nov 2026 15:33:42 +0100
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
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
Message-Id: <5A40DA10-E001-49C5-9432-F1494F6CDD49@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
 <a92d44c4ba920358003d475d4cac7541af037f41.1795505160.git.hns@goldelico.com>
 <608d13a4-6634-406e-aba8-b48114895cc0@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_063437_565172_0AA35652 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Mark,

> Am 24.11.2026 um 13:05 schrieb Mark Brown <broonie@kernel.org>:
> 
> On Tue, Nov 24, 2026 at 08:25:44AM +0100, H. Nikolaus Schaller wrote:
>> Extend the PCM1754 device tree binding to describe the related
>> PCM1773 stereo DAC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Agreed. Should become

	ASoC: dt-bindings: ti,pcm1754: 

Unfortunately there is no tool to find this (neither checkpatch, Sashiko-Bot,
nor ChatGPT did report it before submission and I didn't think of checking
again).

BR and thanks,
Nikolaus


