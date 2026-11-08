Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AF606D81F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hoKAJVh2;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hJJ74bqx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:References:In-Reply-To:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sd2F6E2+vvUGJZN6TlZjvTejd/w2j4OQKJqvFBSb3+I=; b=hoKAJVh2/4bDvoWW/kAVN1QAUU
	mX3f8+WU94ygvEiRELGinsPTPvtdc2oxjSNI9E+bXmfJJ8bD1N4/SyZOilb6+1rKke1Zn0Z3AJy3i
	jzptaDIgrlfR1lowvyv9kNhGVOpC06c0k542dxx8sr89JreQogroyCZjOnhYEUoaek5o8N2UWwwDL
	BZTgBTFiTJGKAGzAJwZSDhiJsBQS/t3HBfdqJYswano1Qw8oQv9sl2Iorg87r4kz3uscitBl/Q8bU
	Fli4PxU6c4V2EtN63mf0hj8sPb/tI3Psdrvt57jNwPAJmMCJFdd6kDGww7Lk+34J90lD9Ww5G+4gZ
	KqAWVBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6cv-0000000GQkI-2CiM;
	Sun, 08 Nov 2026 17:24:21 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6cs-0000000GQjE-2DwO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 17:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158652; bh=Sd2F6E2+vvUGJZN6TlZjvTejd/w2j4OQKJqvFBSb3+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hJJ74bqxUaD9FKhBA7xB5dHBbk3QiBBtpT2OMZvy7O2vutM0dEVzrDAHLT7PAgC5P
	 Q5xLMfrpY00ddFqtjk/caJUEZtesB7oUvXzD4QatouKZQpGxDVY3MCP1M+Zcu049vX
	 z2sALATlHm6p2/470i/LEyg5huJrBX6StVvOPLPU=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158648tfv7cpwne
Message-ID: <tencent_465445D19035BA754E768042BF2C953EF508@qq.com>
X-QQ-XMAILINFO: MAUQIEZVArhLnsYD8Dui+KlixWzWH6CwW24t1Km4F3nfOJPoBna0nf7p3p3FMA
	 9k7syCti/M8l/1HnGgpgh9ZF3dFNV6lKBmiqWp+D4/7RV4Z6d10cfx2vxCyObe6wLTiwddxy1fKk
	 TFLsZ9g2PTuR05kG/pQIByejueNygMjkwuHqhCvnxzZ0+hEUc0d+aBjvKWxk4WQF5oM7P8+cXyRd
	 LtNndz8no55wErtNYLh/wKKKDo5y4Y16N31KN7zLx59k9DqII/D7sxtNXwY9KijFS3QR5MX41R4k
	 fzLjkZ5xkmiw7fv1sEcKk+sYKWvfEjnZGK7ki79L2syEwmzFF3V/F6QWXVYJM4JrYgVUk6PKwVZE
	 ZnW+oViDj26QaZV7oU31TqKoAlSJE9+KfSwel+JENAGqSAfjGUV8/Qt3SIGr9YZSJvpsTrK1OjHm
	 wLMNur6CQW/cOU3AcOWWHSXm81F7R4QXDLjfddwbIvuqPllFln+jRm5Sc8+uwnX2Zp5xqdfDAhsc
	 cKWiIyQSN4GuzIdj5ah1Eo2DRg5M05D9NfAIy98TUnCO1VLlo4I7MDQqL8NYNqCgkpWxCff5vdTQ
	 WsXqFNW3qj0cfR6bF2e0pkjwndxYugi3eH30Xn+tjDTxWJftdsA++GucSMS3UtJQZa+TR3QLYyK5
	 ryibjHD193oLBGg+DvD9ipTfhMsfb5VEMw6sI/wtniXgbkKqvkE+mTjr5Lo4U1eDoyf9FfdMty+X
	 +OK3nkun6qNbrGf+XR8D3NhmRgzwdGQph9TUbnnI/zmREd7bkDCmJpFhgf/7bpHnKcqX7Oe68rLk
	 Q2apN9ZIeOTvKmh6trGYvIy0J6ttOBS3EtzuY4s9S4ugB1i7KRGNySnvg1j2xk4BDV9dLu1GGcfO
	 lyPvWHUhwBLbF3M4mLFGsT04LRM5zTr3fj2U49GvLCxwfh4J2TCxgcLvmoLWtg+9c+/7nGB0dKqo
	 GMVy13U3D4t+MVDSeRQEgzmuaTrd1AgqHfuvwTeh1jmsr5ggwp8ylSDwjkeTHx7IpGhLQRAAfgJb
	 TFm85pd5Py34fl5dXMOENqzjaKsut9bFzBn1H1jPDoAHybbshf
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Jiawen Liu <1298662399@qq.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] irqchip: irq-imx-intmux: fix runtime PM cleanup
In-Reply-To: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
References: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853265.5.9359140695668758867@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_092418_944862_A70EBE54 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

Thanks for the suggestion. I'll review devm_pm_runtime_enable() for this
probe path. The driver also takes a reference with pm_runtime_get_noresume()
before enabling runtime PM, so the rework needs to balance that reference
on each failure path as well.

Thanks,
Jiawen


