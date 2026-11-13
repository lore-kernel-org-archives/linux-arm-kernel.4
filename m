Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7F606B565
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OB/X9s6L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dE/NsH7p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vd1pmQ/tTy1ka0SKsEViEHEk399ztjWfzFlh1vxTWRM=; b=OB/X9s6L7vUDJd
	3kaMmnLj9kh/1gbruWUZd94hOPCyK7eQx6cJ+PwoLEf7mlFqQ5bJ9Ng91uNafASHgenzmfTg5acCw
	Fq0OEKfkcyOO+GpoVhQCe7khJy4VdTstZQibNA9lNKDCb2y7QeWJNItkBt/VxPOuHR/afjGOrNEIT
	qsXZ17LYBfheurGIDp2CvK9YcuCJwD8Ta/zOo75Nsrt97NBbbhNVXtyE7Yh5dpzRdzvOouPHeEtp+
	EQ1Du+EK7yaSYIkcQHQQfRy7wPHZc5Hl8jVweAxqe/9Xud4m/gRQTPp5r7a5VwHK/D8Q0ND8oh6Ji
	DwM5Zm7yBa7QGuRvfc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfI9-0000000BLGy-2XGM;
	Fri, 13 Nov 2026 00:37:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHo-0000000BL9j-0jLm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2666745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530218; x=1795135018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd1pmQ/tTy1ka0SKsEViEHEk399ztjWfzFlh1vxTWRM=;
        b=dE/NsH7p34m5SgoYZ4o6IOqyFw8Pi1RX1Bca256gIc9zVKeVae8Po3oYAdTLT5D0qG
         aN5vQRUhmJxnWa4p2ku1LS+CQjnJQn/zN2VZRKyCcDDJZp5iA/Q3+fECteODlNEZ2m2t
         9aHPubQdt9kolSOduVwaPLB5iXi0dz3U1bX08yg1wy/Cl0etzBkCgq8wuwGrWWCbZFYC
         YnXZAxAuD96lyeDOAaAE7nzNO6MjSdl4n68VrU1BahNUOU3jt7/S0aWa973eBIj6SyQV
         fQY557b/fZExOIAOpYQK3ZFUDivuDEjDXSDk2qqvYoZRBIyBQcUBjhMmVqVLvNEqZfIT
         DXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530218; x=1795135018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd1pmQ/tTy1ka0SKsEViEHEk399ztjWfzFlh1vxTWRM=;
        b=YHJMFBTOhwyNJTVDGknmvh57KS23dPX2vwVoppLcighMGzHJQSi8tPeva5F+BRKISt
         ya46ubWwbqHAXaWguLE6wGmA0iwyljAyHs/FcjqNWcGaGwZWeIpRgjixNYXpIjVO7Ukb
         Au+BLHvJG7SyPSFhIcIu8wKJOqAaWrtNf5qvnlKa8PXqU3TCl1Gcz0puiUJeYv5u/Fqr
         q33EC6/gM8YWvlLcN6BKYdKsGh+xoEc8zZZ4UCtsfyVs9YEdi4Vbo2oEWO/EbgXjGodQ
         mtIixnxyt4SnoohhzR++Fh71HjqGJyXObx+8TX5a4FAza+Zl7r0855ocIXO15bj4fYCh
         VhTw==
X-Gm-Message-State: APuU4Z/xcrJvg6qLNBrjJGe/jewIwokXn9Xf7xGyHuaFGpDujL2sTZoc
	LTBcgzOE2CqTTWgO4EWgDFIYlzkg9sNhorn5V6jZrHg3bKUm8+ue7nEUEuy6HPCttjE=
X-Gm-Gg: AYBFou2NpXuA6ha09OqoH/nt4aH8YtTvUo8GOlQkaNWiby4gXdtLJc69Gg+KOuDXoI0
	51WdxBuT8o1uvKGkYN/kHKFrazYSNXNhdUiMFfgqRNdtrFuuHfDXBf4VP5d7Cl4jNkjlHSCwoh8
	RepyK2FfppiEEbQhlcmhc3SrXl1/G2JZtzfaH6RK2z3z0oEjq9iugy8qsjd1Wnr4++u/iewDJ4S
	S3FRf1v5Vxkcrz5nwZb65vrvSL0cGbXDadUBhWApaWutrIhUFOqd4y3NeuMl9kuVa4zINvRGXhI
	7H+3004IxTMC86gQRKDI89byZehS+uqICzSDGudiKNqLP0NtuQXTCMXCkbXO63pBiooYlsZGkNo
	cIjKhYf43yNzBU4EtW1JKcQ3yCp73YL5UxMvuNSvBDc9qQQeNfYTo/I0vxnWobPtQACb4q2lt+o
	41Co5S0HUM1L2i7SY+dLuRXyruOR00swmGMuCZ1FB3TFAo1xp+4G7kv6g/gGaWLUiUNC70Te0ZP
	Q+dltZGo0iQ3ykd1hsR9FNqC8W2jfp+vuC6aPQwTyg7b7sQO5gadZ8bdCgGh5cH/orUNHhPkTbR
	nJlkyq4L741hJjGsLk1v6Z+wUjGUvIPwFfkIsXqSqcWmYVdJYZaAQp/ErvvwSawJNTm1tMPbEOu
	TyVmR3lsAdAiJmHDTbI9HU4QuNByOE7cjCqcaJMoil1LPbsUqc0TbMOWUXLx/jiKp9ZJ8ZK6enF
	tGWcjPCta8z8TRKsj2fFdQwAJ53VtQcY3GjKASPHk=
X-Received: by 2002:a05:600c:8b56:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb55ad0711mr16815645e9.29.1794530218377;
        Thu, 12 Nov 2026 16:36:58 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm106506085e9.15.2026.11.12.16.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:57 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 16/24] net: phy: Add Sanechips ZX5201 PHY support
Date: Fri, 13 Nov 2026 00:36:55 +0000
Message-ID: <20261113003655.3665572-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-17-ghahramani.navid@gmail.com> <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163700_234766_E262AC98 
X-CRM114-Status: GOOD (  22.57  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Andrew Lunn wrote:
> What do you get when you read registers 2 and 3 of the SERDES? Is
> there an ID in them?
>
> If the mdio bus is scanned, and there is an ID, phylib will try to
> probe a PHY driver on the SERDES.

I read them on the board. Registers 0 to 3 at address 9 all read
0x0000, while addresses with nothing on them like 7, 20 and 30 read
0xffff. Something does answer at address 9 though, since registers 22
and 27 there hold the values the driver writes.

So there is no ID, and no PHY driver would match ID 0. But phylib only
treats an ID with all of its low 29 bits set as no device, so a bus
scan would still register a PHY device at address 9. On this board the
MDIO node lists its PHYs, so of_mdiobus_register() does not scan and no
device shows up at address 9.

> I would suggest adding a probe, and validate phydev->mdio.addr is not
> 31. ENODEV, or EINVAL, to indicate the setup is invalid.

Done in my tree, the probe returns -EINVAL for address 31.

> It would be nice to reverse engineer what these bits do. And then add
> proper LED controls. However, that can be later.

OK, I will look at the LEDs later.

> This says it is an RGMII PHY. Why does it have a SERDES? That suggests
> SGMII?
>
> We need to understand this, because if it is an RGMII PHY, we need to
> address the RGMII delays, which that page says it can controller.

That part I still have to find out. My driver has always told phylib
gmii and the WAN port runs at 1 Gbs, but I have not worked out yet
what the link between the SoC and the ZX5201 really is. SerDes was just
the name I gave the registers at the second address, and there is no
public documentation for them. I will find out what the interface is,
and how the delays are set if it is RGMII, before I send the networking
patches again.

Best regards,
Navid

