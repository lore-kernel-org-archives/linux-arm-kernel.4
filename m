Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IZ5UWs/K;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S1akCqD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p2xNedof4Ko4NfZmXTB64oZmhca+eJLe1h7G8tH7eCA=; b=IZ5UWs/KO1ApMH
	FT9nFElpFD2Y46EAjMM4yPpULOMhQ0mOERcriybDLvrfW89IjFL6Bkk9CPRkYdn1wPssV9L7iwqTN
	qg+5NMS09WYk/wP3NtAV7VVrnDCywjVQt0wm249yWiyXT/IsU6cgvlll3eXTv91SQkVnaiGTjrNP+
	PcZ6lG15o9WBWBpkQjqFngHCsgaKQ1qabU2iqbd/oOSY1w49h2gOyZhLszo8USe13RJud2TIIaPEE
	frZ2nPAt1olXOH6D7wm/a9mei4YJB8jhv0HCdJ2GequoB4Zw1P54tGCCZ0H7R74/gTw/fisVZ4DoG
	q304A7OKggmDuUb6hmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgjF-0000000EXOG-3YOK;
	Thu, 26 Nov 2026 21:10:05 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgjD-0000000EXNp-0lvh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:10:04 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 7A223404C4;
	Fri, 27 Nov 2026 08:09:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795727395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2xNedof4Ko4NfZmXTB64oZmhca+eJLe1h7G8tH7eCA=;
	b=S1akCqD7pVd3giXAKn02vOqeNyJDsak4S+Ugubkxc/i90OCi5kfA20TMnUYdjB+qWoZYna
	3PHuW5rvdxMxQOvILicRV1PEuoke8XP8DCJ8cSvYgwdjJO/7wmnraSaDE96HZ4PI+G5wa6
	Z5fa4/2Z6283mm5dKO5hwu5vae5YaXILEyxaYB5n5wF6kOIzIpR3Jqc8g3wmJbPvQILQ+6
	KXpXhXl5U0fwy4xBFb0b8Xk2uh/hBV7gEc9JLYavRbuRolcrVA+XuENk0uwB2NBgbmqpCP
	M9mdcp3ELGtbgc54+yIujKa2D8JSRMXVQmH2HKCYiXHNEBFpCsZQy5T0PoYQog==
From: Alastair D'Silva <alastair@d-silva.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v4] pinctrl: sunxi: use automatic voltage detection on A733
Date: Fri, 27 Nov 2026 08:09:55 +1100
Message-ID: <20261126210955.3021478-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125-a733-pinctrl-v4@gmail.com>
References: <20261125-a733-pinctrl-v4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_131003_409332_96FEC790 
X-CRM114-Status: UNSURE (   8.78  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 03:33:36PM -0500, Enzo Adriano wrote:
> A733 uses two-bit voltage-mode fields, but the handlers selected when
> v7.4-rc1 added A733 support program them as one-bit fields. The R-PIO
> handler also writes an A523 control register absent on A733.
> 
> Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
> POW_MOD_SEL at controller init and skip per-pin voltage setup. Use it
> for both A733 controllers: the A733 User Manual v1.00 documents 01 as
> auto in sections 18.14.6.1 and 18.14.7.20. Give A733-R a separate
> descriptor so A523-R keeps its existing voltage handling.
> 
> On Orange Pi 4 Pro, the one-bit handler leaves bank H in 1.8 V mode
> while supplied at 3.3 V, breaking RGMII Gigabit TX. Alastair D'Silva
> reported that selecting auto mode restores TX.
> 
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
> Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
> Link: https://lore.kernel.org/r/20261107000135.6b684277@ryzen.lan
> Reported-by: Alastair D'Silva <alastair@d-silva.org>
> Closes: https://lore.kernel.org/r/20261125115703.3724690-1-alastair@d-silva.org
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z
> Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>

Verified on Orange Pi 4 Pro: PIO_POW_MOD_SEL (0x02000040) reads
0x05555555 and 3.3 V RGMII Gigabit TX on bank H works at 1Gbps/Full
(DHCP, ping, and iperf3).

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org> # Orange Pi 4 Pro (A733)

