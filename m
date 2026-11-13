Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B902606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B0ALzJaT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LYvWahyu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=; b=B0ALzJaT1geFsu8CvKYSyQHoyu
	KHuPWpFhHV89Kub0R5RfrqPo2kYOEggrA07aCXu6k1ko5dyFQoaIlPB/E/TmwXKk5Dohim71rnJkY
	DfigPbEsNqVAchEi6olshLfHFP+6X01RSD7Cs+eLUZNZolNrEDzIS5mYLu9AU2kocjjoGs4ChstxV
	cvojhLvkd7e9f6yLHjhlAVnF+Uo8hUdDszYReqbE9MBwap5JMK5hnWOOXq8yxsefowS8IUdriCvoW
	t+1t0FXGz6rDXjlxxQ0GXjjix9WbZ8zSj2+DaVPWiiDAV+e1eqv5oAKXhwu0ZeDN5TiUB+ori5KJq
	e/AEthyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxw1-0000000EQ8U-2tYa;
	Fri, 13 Nov 2026 20:31:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxvy-0000000EQ7f-1LhD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:31:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b1c2c31a6fso74003a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601901; x=1795206701; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
        b=LYvWahyuWfibwq+wIg7FggSGoFzy4sfRCg34zf15fCJEwEnbOrX3LZsFEqaimaSdll
         HneuCLTSp6o+Q/PHkN2M41LUM7iH/JLlbmtsTXh3/nJNyWsZAcUp7Eq1dd2ksu22WNWg
         reKlTH1BJ4cch3GhvYCFZBLIEcQpYH5P2IvNhcScqc5sYaW2KcAU3QNJDdOz2yIKy6cm
         PrJmk48IlmnsALXFSZx7rP+hAMt87bImwZFmSKdRxMpCNdcQCu8zPsRJBueVQLAi0bcI
         xRt3thJlbyN4fYZdwVn0HF7s1S0KlGjjJHvA0WpkO8HkMu8HYdRG1la2kR4em7S2OKEh
         ZQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601901; x=1795206701;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
        b=zsI1fgID51SdoLfJxzsBZCJOsEerv0ge/J8tpvOp0JY4ci39UNGasLvdULvaSu8/ML
         nJXJCFmi1nObmwKCFY7hW5Q1qd5A6hHnzICyebahGYwlN4Hhy5IqtwNYa4SndCk8ZJx6
         o3qxX8bITquPm3ElGDcpAJQZFmKs3xeewJJiifr7/gDqu7lbY9BwKqbgSdJdlRwdXY7+
         5z3iBKdVZeE3xohIxOZI/rS9J4mQ6HF6wM65HtUXYNVLvCfXyOfPgYO0ApZafWtTeP/v
         u09o/EvCli1kTZTD192JEcyQbmJNOETocvsYLh7djEixUw5Z4h0QrbCwy8TfHtt0Km1k
         TiDw==
X-Forwarded-Encrypted: i=1; AL+hErEB183qCEmuNZZrkfoyK5dDsL7SZvBnHxNTKvhkKZUuiaHaNYv/jRxhuJFu2TEM+B8kXVxYhHSx0uZN+TosdVyg@lists.infradead.org
X-Gm-Message-State: APuU4Z+FxoaLuEBlHNz6q6XPNoNI1cFc1iDy/rMwyR0U9QqIn3Hnrf8n
	9xg/HZuZJW8y6uMm3xusyNwVsRIeGOIdsNjg49TAcCMQH8EyVA8amZdG
X-Gm-Gg: AYBFou0uoGVOpzzUoZxVI0uluvDxT9qznyUTTFI71is4cBEY+KcR499Dtj26hkLsvR3
	h9vdwjSG6IeRAEqU6Miz2LCEJUmWqjBAq3WPo5pG4YespxmMa1IwEoD5sk9K2LxU3TmXahgM4H2
	+MulxCypeP9ZvW44A74WozFHLGfVvG7JaF5DdedUJ96bnMA1ikAPfw1jNoFkim3vTkokg02LuUx
	N085HRi7tltV1EYKhUyZ6SqpTrWNDCUEyKVk3vhnp6UKtOQlDtKFkoEj2ZXEF8ADpnPhR1N6mgC
	Vi9FtMiwBmlrLjyQd/+y3pYXMjoOd9+6t+9SZrchhT1PiBjUs9cfDU3LlQ8PeWvvrqj2yTFKVMm
	3Xj54eRW1XIl88ak5mFAHokAyuXagul2k5wemD8b/Pbb61gXEGRWc6EQsPAhuqfiFRtNNgITDiJ
	ZVx5wtpY5tZfLNDwGbGp0WR/7OxDVdONs3BGAlKXAxRLOVWoc2wU/Y8Ag/oQKK91mVrOtMxFUOe
	LGJq3KHVfEjkJh9+YY+IqT1L3WrAx1Sr7b33FNI+HXa1eT9c5cjRKHj2lx/t9Z9VKXAx3SFRFzL
	BYWo8N4V9DOJhADkTI5ZE8u3R/THCC77MO+xtu+j9NJpw4A0qr3XmytNSL26krtUB28GDuzCQRX
	u0y9SQg==
X-Received: by 2002:a17:90b:590e:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b1b0b85d16mr5379769a91.4.1794601901202;
        Fri, 13 Nov 2026 12:31:41 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm11051461a91.16.2026.11.13.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:31:40 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Johan Hovold <johan@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Saravana Kannan <saravanak@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] driver core: fw_devlink: Don't report refused
 sync_state-only links as errors
In-Reply-To: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
References: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
Date: Fri, 13 Nov 2026 20:31:39 -0000
Message-ID: <179460189995.183918.12921536578133287930@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123142_363764_71DC71AE 
X-CRM114-Status: UNSURE (   8.47  )
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

+Cc Saravana, Sebastian, Ulf, linux-pm.

This message was explained before, and I should have cited it:
https://lore.kernel.org/all/aixze8zFboY3huSf@venus/
Sebastian writes there that it comes from one power-controller device
providing all Rockchip power domains, and that it is not harmless: the
kernel misses dependency information. So "harmless" in my commit
message is wrong; the patch does not fix that, it only lowers the log
level. It also lowers it for every other failure to create a
sync_state-only link (found by the Sashiko review), which it should
not. One such case is being fixed at its cause: on RK3576, Sebastian's
"clk: rockchip: rk3576: create proper platform device" removes the
lines for power domains with a clock phandle:
https://lore.kernel.org/all/20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com/

Please drop this patch.

Arun

