Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF04606A882
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1AFAiWZm;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Xic6RRQk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z6JTZh8vNDGRD9x0jZi5MafAeLnjKMbQyD95TlqG/OM=; b=1AFAiWZmLANtkqXcNzW5V7J4oi
	2iMAAbQ7hI9yAQ4uSjnjEhw/sbtCg80gnuFg1Gg3eTA4HdIysXmkqZ7C/yHdp+xuDsMaoYKlOyR+q
	3l3DGLbuQHWYqV2M1YoltvYnNHy+p7MK86UHfLSFi4T+2on9MOWrvtJb0cTojHmyqnJgqYZD9fuhs
	Q1/AWxaQhTQx9z6OV42meFKu+BK/OhBRQhHnSEf0WrBLr04BTql1F/fswudC6wmm9+FKPZt6IfZfH
	xFRHYc3eiLNIKxYKzPxQpkJIUD2dGFcOQC8Gd/NafapxjehxjkXjRRuOqYa/MY84VbetvKkzoyO26
	IpeIV2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRY2-00000009RHt-0ABh;
	Thu, 12 Nov 2026 09:56:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRXr-00000009RDs-1nHL;
	Thu, 12 Nov 2026 09:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=z6JTZh8vNDGRD9x0jZi5MafAeLnjKMbQyD95TlqG/OM=; b=Xic6RRQkqxB4/7hx0qfNs4vPAH
	6jnUKY/DtcS/rcmP+Jzd58MEZw/xE2ekU9owR/e2/PLQxcceHWCLf+UGK5uA0mtExyxxy3DIPjSOw
	YPrePb+ZSdV2E8o+LGOnvRB/DTJU7cT2q58WZeKj4bTgDkCxS4d+1UVLGKKwGeeE7sE5Hg1Tm1J/7
	uxKwRBcuovEWZK5ny7FaX1SqEeLFaMVk3O4ADPVh8Lwt/TiOMwnLiB+X8VB1hqFiZ+I13/Ahz5iGv
	uTgJONfjj/MeC49xcJWWa6B83ezlAW5JgiA0I8htiX85JVt4TeNVfl5pUsQtE2wO7gyzTaoo+gjsP
	C/EoR3Cw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, aiyengar1990@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arun Iyengar <aiyengar1990@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C port
 self-powered
Date: Thu, 12 Nov 2026 10:56:32 +0100
Message-ID: <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
In-Reply-To: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com>
References: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_015639_560887_9D19A39C 
X-CRM114-Status: GOOD (  13.74  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Donnerstag, 12. November 2026, 09:25:10 Mitteleurop=C3=A4ische Normalzei=
t schrieb Arun Iyengar via B4 Relay:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The board is powered from its separate power-only USB-C input. The
> FUSB302 port's VBUS comes from vcc5v0_sys through a load switch, so the
> board never runs from this port's VBUS.
>=20
> Without self-powered, tcpm keeps Rp on CC during PORT_RESET (error
> recovery), because opening CC on a port-powered device would remove its
> own supply. With self-powered, the port opens CC for tErrorRecovery
> whenever it resets, including at boot. A partner left in a stale state
> by a warm reboot then sees a real detach.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> This was patch 3 of the series "usb: typec: Find a Type-C partner
> after a warm reboot on the Orange Pi 5"; it is split out of v2 of that
> series so that it goes through the Rockchip tree. It does not depend on
> that series to build, but without its tcpm patch ("usb: typec: tcpm:
> Don't cut a pending state delay short on a re-queue" [1]) the open-CC
> period at boot is cut short.

As you describe this as fixing a stale state accross reboots, does
applying this before the tcpm patch degrade current functionality of
the device?


Thanks
Heiko




