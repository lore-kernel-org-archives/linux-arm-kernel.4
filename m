Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E195606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J3iIrJ3f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/WOcayzJUskhUHuQDojqHJCdJ99yTsrsphbc40waRqk=; b=J3iIrJ3fMe0oMQ
	PjDOK7F8j7frfwBNg16Wll/zPTHzE1GQ+zCZcM+Z7wsDSBhhotTWxbg0awTElzaFmFUlnEBHDpZjB
	MqWDilOc0l1nJWss1vT1HXbSFxmr4y2PgZc967rr6h7ASVY/2jKapsK1HyncbAdLsgwPd88p4ZBaC
	XmFYYfzZiiRSBh/WVAaSz6bh+jgaBRB3UpXnZIGRb051rMZk18yuDm8P4vRc8yiC6xyuS0gfCsGAK
	5A+2VeUaNin9PJecCK8OEnAW/nlEhGxsIpW3lBgcPd9idP1h1iWnyUwyHybKkO9fj0urZr7DzCXKE
	sK3rhjRjpMUIT+kOz2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQthI-000000055Bi-483s;
	Tue, 10 Nov 2026 21:48:08 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQthE-000000055B3-3roq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:48:07 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5067a2411bso13712666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:48:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794347282; cv=none;
        d=google.com; s=arc-20260327;
        b=As3UaV5vtmy/+k1J1Ow3fzeSyM9Ud2IfjAB9xSL3P1gj/y41zG/BhbKndNny37vG+W
         q9zL8x3m9Z7hAjW3hkeBvUHuWgycPDQH+XFlhCejk0SAEmGVR3g9LyMMGPwVVkuXwZLZ
         iyTgzQYRb6c2wK1QMnmgYvngADdeG1GlSytF3YDZa7IbplZ+JiuBsu2rZ/GsAXjiPPBA
         pyhDjq5q/fFRXsw02PVW7GoHJffa1wRE6Akx70SY5VI6tF5v1pb6DPan2+PkOIvTASfK
         1uLFlSY3R/OnOKEg6xS9B/pVjzPr0bNHDg+w9qugOEj4ItYFNkwbZqkRLWvM6lCPHmnG
         x7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/WOcayzJUskhUHuQDojqHJCdJ99yTsrsphbc40waRqk=;
        fh=nVAfolUDaZXC8lxzr1U6aMkJ5MopMy75y49nK116Jrs=;
        b=jLRlBP/T1T1foJHgOR8tvGZMIJutvAV2yDON4kKCmXtFvw4CXks3NYBH79mTNHsWZH
         S0nRfss/yjL6D7bnVFW3MCn0m/14Z3knBerGeYv/1EAXpUbl5HZtRM+2p1hZcCLwyr5q
         Hydda/sjtArKIsshTgqsoq0uQdZyKesAN4RSB7liQ4OnFxjGaHeIC7fCbEbMEqx+v1iK
         N149EL4oahw1bV53rjSBpK/WiDOXQ8DoN1ngCFAz4V3CGFVCUsvsQ3zPvHDuixbdA3LO
         B0fXdl1ffF+sz/R+8Go/nHlec3KVzfsyl0wxycoIllNAHwn2/7BpWXkyAUnQHfzEKnMN
         z5Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347282; x=1794952082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WOcayzJUskhUHuQDojqHJCdJ99yTsrsphbc40waRqk=;
        b=VVn9Hkdult+SScoQsm1sZa6pn1LOB5i6kF5iSCn2WsqSki9cBlOZAuzcEcFtaVW/OW
         RmKd3nGR2CyefAKwmG7IpkHYY0xV/mTJ1LqH3QwEgHsUjty3kqC6SQFi4gvGSL+IwjPE
         XZBwf69W5tHz2Z3ttTRjfCBfmqwQppc5c0FFCtW7gN99YWIWi3WSIH0pQIxuv8IlwtE1
         /81cC9C3e4hcehu4jiXZnfdXgI7pSOldMycT2LwQ3EjhrR1ur0Ukd858UHzNDBRzt85M
         DAVrmUhJWIa7zCOu/niKK8XkZBSPlw9ckrAH9L0KqVXTD0+4kjPek9zJCEoDRznsMLz8
         Vrqw==
X-Forwarded-Encrypted: i=1; AL+hErFQ7r5cNDV+k4vK+qAGx4NYeF5mHdKVosEdlNQ8JgG38pwz3a31Y7yE2wl4s0Ssg27OL3uj007I8d7MugFAFk0x@lists.infradead.org
X-Gm-Message-State: APuU4Z8lRTJuZjvrYfhtogkANpkoriPpRMDGgd/dHhXdN1xybg3XQyCW
	yjKGEOysQY9CdF4WBVaoiL7oAwQISgjKRT0tegWog6soBqvQ5QcUi6YtfZ+iBCk77e6mui0GFD4
	k15LiKxgg0ijXjqrHK0JEuz2Q7BR8RaLWLntZhzx/HA==
X-Gm-Gg: AYBFou3j6e14085/lHFwCvpGLv3gsLaxVPxXUgEgWAIly9ypQq0DZnB3ddtjlrXH2BD
	c1t2NEQy36M9DlVrHhfpQKtUU3lpFRHUJtZgrZksLtgtR/iW5tuKisU6QyBhqcAR7ktWAXp6rw3
	nsixaIjejBdW2RRf6RQsKFV8llOoLGuUZQ4y5ODZMFfzPjL0Pd1yjpm8rJfyawyZ+BwBrIoBL5n
	TJnwe5WBiihajAt93ve6TP4B3yaYYZVuHGddlUc+ncWuqW9+BUiGjQsO5xtA9w5/yTkvGW0OyTs
	1g0ug6k/3q9rmoki8mvvavzoO5zhdHrG2AcncFMwyqJk+YdqPh9fyHKFa/IpjIroN73/mp+AAIY
	vf7ab4Mv1H+etfi093r+d/PUWyRX2r9INI0Khhd4BtfP1t30bNA2GNnhloQRgBUFuCShEWn+V0J
	+Y4aX82pkPjF9ZLx4=
X-Received: by 2002:a17:907:d311:b0:c40:cee7:3918 with SMTP id
 a640c23a62f3a-c5066d8cbc0mr27479766b.44.1794347281996; Tue, 10 Nov 2026
 13:48:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104151914.2651241-1-opensource@grische.xyz>
 <20261104151914.2651241-4-opensource@grische.xyz> <20261110122536.7cca85ce@kernel.org>
In-Reply-To: <20261110122536.7cca85ce@kernel.org>
From: Christian Schmidbauer <opensource@grische.xyz>
Date: Tue, 10 Nov 2026 22:47:39 +0100
X-Gm-Features: AclHuK-CLlMl769sSx84CkwDdaR-obj6arfB97PbP_3TdPcxS2uglw83nZZfEio
Message-ID: <CALsH2cyxzm3OTzyyFhBk_LSkFk4sw+6xcAtUc3hVJoLr8WO03w@mail.gmail.com>
Subject: Re: [PATCH net v2 3/3] net: stmmac: dwmac1000: stop hardware from
 dropping checksum-error packets
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, Oleksij Rempel <o.rempel@pengutronix.de>, stable@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_134804_979788_F346DF4B 
X-CRM114-Status: GOOD (  14.82  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,BULK_RE_SUSP_NTLD,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FROM_SUSPICIOUS_NTLD,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 9:25=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed,  4 Nov 2026 16:19:13 +0100 Christian Schmidbauer wrote:
> >  /* DMA operation mode defines (start/stop tx/rx are placed in common h=
eader)*/
> >  /* Disable Drop TCP/IP csum error */
> > +#define DMA_CONTROL_DT               0x04000000
>
> Maybe just me, since I don't know the HW, but what does _DT stand for
> in this context? Other bits seem to be documented with a comment,
> let's document the new one as well.
>
> Not sure what the comment above the new define is deferring to, either.
> Should it be removed?
>

DT is the Synopsys GMAC field name for bit 26 of the DMA Operation
Mode register, see [1]. The line above the define is actually its
description. The define was originally added in 47dd7a540b8a ("net:
add support for STMicroelectronics Ethernet controllers.") with the
comment on the same line, and when the define got removed in
5a78fd3debad ("net: stmmac: remove unused definitions") earlier this
year, the comment stayed behind.

I will move the comment back onto the line of the define in v3.

[1] https://docs.altera.com/v/u/resources/r642178/cyclone-v-hps-register-ma=
p

