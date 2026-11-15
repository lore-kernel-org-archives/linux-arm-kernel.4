Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DA6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n4POm1Zv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWVzejUX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TEYwC0yd2Q6rJp4otTipe3rkKTLSLdWxD7WurCB1Zgo=; b=n4POm1ZvyOi05W
	kI5PZREWiBot1zUwuT5fGWYiPqi2YEFvi4eufs2wQFMlubjF/tA2OGmdQVZ3oGonqmhzmKNCDoJVU
	6caa4/HdEQPzCT85Fvqc5VI983GnywcLIHyOzQPz2OefzyIvdEvrVmrm7w0R8fCsMq1fF/sVs8Mtl
	iQt5b1mKLNN+l1LAyOZ74xz2pUuf+ONLSny4gXQ13isdoOAhqGzcJIsZAp4S5jZ4p9TwZjXG6Wl5a
	vfKq+cmOnY60ZYEdvKW1zD0HKXD4RAD5xdyPoEmOgknM+Z3p/Jqz0eSRlwTrC0d87KxevwnUdCvkR
	ge/YB8XsiBLiDfg3Bi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSihp-00000000dhB-22JT;
	Sun, 15 Nov 2026 22:28:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiho-00000000dh1-2GMo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:28:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E64094595D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE13F1F000C7
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781691;
	bh=TEYwC0yd2Q6rJp4otTipe3rkKTLSLdWxD7WurCB1Zgo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NWVzejUX9qF0XoM4VmEyXPZSxIG5Fs6unNadjPRXKBSH+vjBwWuW9IwsP2UD1Jyxh
	 N4DWmQdek5RNSEdOLJueNW9tvqDthvnNazJBw0TiF7oKW+Ke/20zMucQiLpYLKA5nO
	 3jDVSQIj1Uzg7SYszycMfFEzP6fakMh9E/SFLUMyyl3Pw1POrN19p3pgZdlMG1hBfl
	 uDu2Fs2NFFfeBArnwiJLuecqZC8ijTgMvmd4rCgRDyv0DuRa4QKIeDtU1FGrbDm1fT
	 9x3ewZn0T3RJPSLbtwwWddaebGc7zSZ3YdLKxYfaWHR5eABuub1dS5nx5aZcMg9Q0s
	 IUuDfWmSm/WOw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c1479a959aso2272151e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:28:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEstgFCP9kytlGR3CLcPAhsAS9Nx8PwmXf/3FmmZ3XKTuyx3seuMQShd6J9Vg9qEyiYV8Bgp2uuE45xL3EcPxjD@lists.infradead.org
X-Gm-Message-State: APuU4Z+3boPlfxtfmzixmaGUqV3va8OLSzRd+zMEHzLsPmw8UrW9Zkp5
	GbaI3QO+E3NxVkxuzOXUR5e5n+JEdEE5cGSuA0kdUP+atyyMaD7l1wakkVbIGxU6HhrSTfu/71+
	WB+2C2rRRDuK1krsZqhlnWV3L6VXkoP0=
X-Received: by 2002:a05:6512:3f04:b0:5c1:4cab:2d03 with SMTP id
 2adb3069b0e04-5c170b2ecf5mr3075860e87.63.1794781690375; Sun, 15 Nov 2026
 14:28:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com> <20261114-b4-cs75xx-v7-4-8f17f38821b4@gmail.com>
In-Reply-To: <20261114-b4-cs75xx-v7-4-8f17f38821b4@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 23:27:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLnu=ycR+_ZXW2K54oeDJMCfybdSUDVOTJ5B=rFTiOnjLQ@mail.gmail.com>
X-Gm-Features: Aa3M54oN7V3Y8V-EQUC0vRGZ-PhoQTaP6aUjOIuJowZCATlHdfiiGxoj1XFGWNs
Message-ID: <CAD++jLnu=ycR+_ZXW2K54oeDJMCfybdSUDVOTJ5B=rFTiOnjLQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] ARM: goldengate: Add support for the CS75xx SoC family
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Nov 14, 2026 at 2:41=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx ("Goldengate G2") are network processors
> with two Cortex-A9 cores, an SCU, GIC, the Cortex-A9 global and private
> timers and a PL310 L2 cache controller. The family includes at least
> the CS7522 and the CS7542; the CS7542 is used, among others, in the
> Securifi Almond+ router.
>
> Apart from the vendor this has little in common with the Cortina
> Systems Gemini (SL3516/CS3516) supported by mach-gemini: Gemini is a
> single ARMv4 FA526 with Faraday peripherals (FTINTC010, FTTMR010,
> FTGPIO010, a 16550 UART) built for ARCH_MULTI_V4, while the CS75xx is
> an ARMv7 MPCore whose UART, GPIO, interrupt controller and NAND
> controller are different blocks. It therefore gets its own directory,
> named after the Goldengate codename like in the vendor kernel. The
> Kconfig symbol, ARCH_CORTINA_ACCESS, covers the whole family and is
> named after Cortina Access, which last sold these chips and also makes
> the newer 64-bit parts.
>
> The generic DT machine is sufficient for the platform, so only the SMP
> bring-up needs code: the bootloader parks the secondary core in a WFI
> loop that polls a global software register, so boot it by writing the
> physical address of secondary_startup to the register named by the
> cpu-release-addr property and sending it a wakeup IPI.
>
> The CPU is a Cortex-A9 r2p1, so select the errata workarounds that apply
> to that revision and can be enabled on a multiplatform kernel. The PL310
> is r3p1-50rel0 (CACHE_ID 0x410000c7), select the workaround for its
> erratum 769419 as well.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Looks good to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

