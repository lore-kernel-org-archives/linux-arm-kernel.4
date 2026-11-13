Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D7606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uxoGMd1S;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iz909RmF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=; b=uxoGMd1Sven5EsLXluLkyrOU4l
	nry3zNCwk/202R5Nbg3d3xf6EEvsBmPxkK67gyBRQhGzkesQg+37ywoJUf/J5Rkpfw6lhJIVXb5sw
	JpEN0bU82QBe7ULgnxX3IvfCq1hVOalZkRmUWTDA37gmexB3aCCGRuT+uVT55PuZPejnb6a3uh5NS
	WNNSj5buVBdMauJ+sk2621TJOS2+S1q4NmlQ4YBcJjgVjZ4aMUYZbZyGoTjYqyutQFMx6aScLzE6h
	NWtX7QBIm1U7ym88jUU9OIBIHcdYbqWT0eNhl9GvwnlDCgPjGUUyZPiuwA+0mothB1VCjWjoGoZ0u
	4RsC9bcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxxR-0000000EQU5-17Xc;
	Fri, 13 Nov 2026 20:33:13 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxxO-0000000EQSU-3GOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:33:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso220353a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601990; x=1795206790; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=iz909RmFsce1uJieMK4Tr6fCBnkBE+iXNecd76EPNXs1xLsws5yqdqh4jngYjVVWmd
         0d+gB0Iorhu9f000vTBhDqCM2lr6aONHQ/xzdBXs6BI+3Pe1AoUtSpCQrxpbOU7WLDqW
         hu4qGs/TW8dLn3kPdHAW+EtiyPaCMfvDvrmnLsqn6F1fgPeQHl/UyfEtzPGTy8DQ4Qqh
         AscBd6F6OzXOXy+WXF4CmCGwvu9QIKiN0kimDSFBfPnc6M3qaywzg4ynHnBBQTN/yk9/
         4EEjE2kjGoO+DRX07BquM2zi+Eelnm5HWAimXzZeSSKHAkN9SoL8AuhmBLgWIj7hc+qq
         O7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601990; x=1795206790;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=h45bx4/7IbX6pBXteFFTtWg4XqGmV1cNZwAn154RgCPvi1+u+1iyk0WWAwyHl3cqWQ
         ePMrK6zuXlBP8cprhlPhgYAybo5asDFrFU66NGeo5eaPBKapPzXpuThdYtYpayz9N4Wy
         BvKvFpwlL++puZ7cN5kZn2Jgu8Oa5TMvFn/2DDc07rPzWzJMB+7VpDInJbDah0lLSMTH
         NcW/YmkYU/SmwLFc4dr61Ob+bTUQfOgVMKas/RkA5MtWPkNksKBqZQy8SEKFAZGGTehT
         5wOcuwQ5OjkBZkB4/V98eoN6osuQ6aZN4m7eFUI5/Vns6Oet/b9PX+b+Um/laakT7DrR
         uaXQ==
X-Forwarded-Encrypted: i=1; AL+hErF5WSK/ATKAzV450UtfeY/9YAC91ZpxaXBobaXDJLlXHdKRcucsYhuIvyaolLP5z7HpNdAzgnxlx/n3z0Vif1ex@lists.infradead.org
X-Gm-Message-State: APuU4Z+l525F3u3rT0HfoPirHzqit1j+3GdC49SxOIuAiQoLiem4XKjl
	7ztTlBwBAVjrJLUgtSmWg6zkyuyrC+B9dxQO+MYv4IZ8TiYBDZk20agB1E2FX6SK
X-Gm-Gg: AYBFou3b5OX95FKKvDYsJvnzzS2F8NgG2fjbewanfLZq49UE9ShjZ4LbO2fGLbTBhaG
	rBNOFOwLgh6mnSVrQQ11wFOGiLEQOxvL06I7sjJDzh7xsneZyw4iV7luWVDpkFnT4dqhuWw1a5n
	tlywcFuijAQH/nDfoxdHUKZcbhgPuNNL3olnjm0OQvOaNvk3ztHqGRPVxpL1EEhnwJhDqWBEt6y
	bG1a6V2G0+AQC+ovoVzUQ6cZJSBJsOlgmTC2W2dmxJv0YE0if8tt/C2hMKE+DbqZtqUEGJwuzGt
	rvvliaZTRl+fZqiYWcW0zYZM5Icx8DEizH3e1NokBrAQC8vDyTXePZU1duRFQtnLmoSPX0eFT8U
	x3i24mNsytlyHqYyKzZ+jwPSHNadUoPqjQkCqkeKTl6gcXRVrKUKzE1q3svkUJmMO4MhkjMO0s9
	BmnfQsgcS1Z6P0I7eJQ/k1TkOHZZHbo8tkENPrau9z4/UMkprZvwZu76SApJT6z2HI637aBKPQ1
	x5LI/H7DQo1D2csLrC2ZWr7YPYbL2fV0jqKqWbw6ht06jm5tq48t10zfDjqTMDgMG3Q38bbRzLR
	H/GQYYa/OEpNKdR/avlhyK4UvaIgxYzrQopjxzuwgLjXrhRmHh7WErjONrFa6DZ7n6duHvwHHvz
	hHs0L9zZQuVD2Mhtu8Qk3CgsD4t0=
X-Received: by 2002:a17:90b:4d05:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b1b05aabb5mr4604273a91.0.1794601989766;
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm11168256a91.9.2026.11.13.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH RFC 00/12] media: rockchip: Add a VEPU580 stateless
 H.264/HEVC encoder driver for the RK3588
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
Date: Fri, 13 Nov 2026 20:33:08 -0000
Message-ID: <179460198852.187691.10732168634380090377@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123310_826137_BD9BE37F 
X-CRM114-Status: GOOD (  10.54  )
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

I'm withdrawing this RFC; please don't review it. It depends on my
H.264 follow-ups RFC, which I have dropped. The cover also should have
said that Detlev is already writing a driver for this block, as Nicolas
explained in the VEPU510 thread it links; I don't want to push a second
uAPI for the same hardware.

Detlev, three things from the bring-up on an Orange Pi 5, in case they
save you time:

- HEVC wider than 4096 came out corrupted with the external line buffer
  (H.264 is fine with it, tested to 16384x2048). Tile columns of at most
  4096, one hardware pass each, as MPP does, work (tested to 16384x2048
  and 8192x4320).
- MPP's "TU depth 1" is max_transform_hierarchy_depth_inter/intra = 0
  in the SPS. With 1, decoders misparse the residual.
- Two streams, one per core, with both cores in one IOMMU domain and no
  dual-core handshake, ran at about twice the single-stream rate with
  the same output as single-stream runs.

Arun

