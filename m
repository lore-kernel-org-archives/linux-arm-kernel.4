Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D776606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SBxL6zNT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mpY8f5gV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=; b=SBxL6zNTpy7tJaMpv78B4znvCS
	dTwQd9BeXdNQzKilQTRkJsnd6FirNSuqCUZggJreOGbdNUZP1vTPcDDVJnPmKu8S6gAAUT8gG2FqF
	x4tRGOC7FaFvRgexIGiA09u9af7mvmmV/hJYZMYmVTqSO6DMxl0N8j4CVL1GhLBHAFT8M5rKPQvAT
	q73iID0M/IH/G00qA/Ps6oFLUg7cCjhCUjj+6oQh3O+1bUWPwx+poiPyMLNJP2spvJRzrl4LeT/R7
	VvwkUa4Pmb/hCXmR+JcYMi+ccG3Wyjn/xU8Gb4hxoJbQ/RJ3SDMiIwjblK5XGUKMwt7vszndmGjc6
	HgOU+LiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3ce-00000000tNx-0e1w;
	Sun, 22 Nov 2026 09:12:32 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3cc-00000000tNV-1vcy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:12:31 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5c00c727a26so177202e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338748; cv=none;
        d=google.com; s=arc-20260327;
        b=hKkAQeiA5+UDJVeg5zP+ZmAX4AW4vE9nrPeVlqcuSwlszGoXQkP5e6GxIpFZ5QJXDx
         o0wGuYc1q5Dkmoz5yT6gqjhBny2bfkvOnRSUwDIq3pa9JYZnICIkKcRp2j2hTeZ6yIH4
         V7/m/RCdUv/5wPY3Kog1NgwdvtlBk2/5rxS+YHxcLNLUnNZbXiG0Gi4Kbl+lcfu3cFeK
         hFFCrkqbn0JPtTYpYdxfVqN/hKmq7O4xJrth7mzArJAD7RiGD3V8b8qnRw7LL2C3HqN4
         c7ZBNVGvdgmiSmy0u8nyiRavJE/BhOeVivDNNW0jlEWjxW3gY4ulaIodkFx7DpXZ+lJn
         o4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        fh=chOqVfc9OeAhTz/fEaLO4GyxUBHUq+KyiymyCOPSLT0=;
        b=XiVG0h16litQKWVMZcXQbxW22AfRW7Ob8Hlyp7yDgQMWbj2Dkq6Y9+U5WPj1ty1RKk
         NnAJXyiHsFOj9k/QVdujSFta2Po6t+vms37FzHUugCaHyNshrkiJFlfeliV0IkYZQNwE
         nXcTquYTtZaEYXiqQurXUbjM+Mo9FKk/40zOpXbSGbIqwepTBV+G6SBffVdbVp1lLCvx
         VFgv+dTTh5fsdcbulRMfGR5dRpmxreYL+PX32RMgxaM5MVThg2M0brRaMk4JLOVb/LE0
         wBG0vcezyiDfPCA/VHRzS3gTfnpFz7GlxrR+ZcMgvsspazkdeq42DvxowkwDrgoQ8Wmt
         7F7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338748; x=1795943548; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        b=mpY8f5gVK73lD7T2VU06HzEogxUglLBcAu8m/st44Ldj/RkJt9/+icIMV35nZcMrdp
         XLp0apaa+homwXjTRLHvOam7XvMDutyCXP/LTvBF5tLDfQllQgx9+3oDm/Y1Nar+B/t5
         fBEI+AmNxf7Pc9otp5EVIN5+B1WcvujAglKtGkG7JVXikvNootPtHFOjIZzB6QFndFhI
         zwFY/e2pbVlsrcMcLqHNzVanIPdGL1UsW61BzAUid1SywC2aCLnKB3KLyXlLb5E5xmUX
         8ZVXbPMcYYT79/vCnyA/6lKA6Al/yg292l+IXJ+Yvi6+Jq/jkV1LCGYWen2KyDSMf1pN
         YWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338748; x=1795943548;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        b=Zj/u+o3eDUwgEdVXBWXmkk8mnYS/ShU1nIpyWofYYJGQLApTDK/RTeju8mH/Me94LJ
         +uCOAeVrwHyFDoyGGlbnwGjTBXkH+7up09dryJpZ1IQqer2W/Y0bmVXdg+aLD4XXCzNs
         u2gIqijrn9Q3qNYpIfi6YPIBQFZYV5VMgI0NFjWQXZt4S63cRK/oHyaySlDIvcDmXs/4
         0e7l1OyZiprCWjohTdPugQYgFqm+zX7CXNqjAN1oUUCxANO4Ts2LFdTpqNZOQeacL7Lg
         0leIxCfzXzPbXfXW9PwlfYGj/xQWen8E8X7bH9g4zaeTbdFauIwz29aKtq7DPucChilT
         e5wg==
X-Forwarded-Encrypted: i=1; AL+hErHhxG2pUp7nDSpvemA7Ev/g2LNT7WyUOSNBXvIqaprQS9m6g/fh6xzTgJ3+iNLfiXoZL9yj3FEoKhaFsvPjgVaQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+3JiXLc3RkV27IPFDbkBg9bmds1MpCRJWCR7au78f2WYbbjccn
	pDuvm0AM5b/rIzEAVNw0gCvZPUKXjPAovXTnjBH6VgkcF/IYJnLqtf4wFgjrLYD9xZYWpCONuRw
	BiVvN91TOZyUvEec3WidDy+9ciX3gH+M=
X-Gm-Gg: AZFdTZefggxTulnko5CO2qbby1g4gLRf8LIsf+68/mMHLwfxTgJcOXmQQaVF2trglBV
	CEiXd5zWcQ7Um6sTOX7HhHa/9R9hWiJy1X0pO4EDi8mTzdr0fZiATBCKmzY3qH0h7vlR6G9Ct6g
	dfCdVEUathOGCh04Y66fd5vDnGd2Mdgc6nRR039gEFQh962E7nSvgq7pB1HOLuCSCrEgMaTKK8y
	HNSnoMHLE9PFXT93BSXjBIynuCTHCNAyK+f7WL0rYLXOnJ4kZMEBBgH5z9mqrjD/iKQNYBK7T9W
	XXjiNQzLn+0CaiOENjEOouL+B+7RBbFhZ4tHqB45o8WnCncVE8TXZaVLAVtMHKos+ZDQWVOMXkc
	8DaTvKSEnEBKqBDiz0QrCbsfQohbaRAkxj/ZgqSstMpZqS5SqV1ktsAxKgx/ho+9CBSh/nR4=
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr3276447e87.2.1795338747873; Sun, 22 Nov 2026
 01:12:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <e72505dc-f20f-4473-98f2-52161e08c89d@bootlin.com>
In-Reply-To: <e72505dc-f20f-4473-98f2-52161e08c89d@bootlin.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:12:16 -0800
X-Gm-Features: Aa3M54oySI-tTJ0Yq8ZA8YifNr7RX6205w52YmRPUl3JnSPbZIf10o3azHoDuPs
Message-ID: <CAEy9hNVyfNZu9R-2duqwFhYps9t58CwZM777yM7AmU0rcc=dYg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_011230_516753_5F3B3903 
X-CRM114-Status: UNSURE (   8.31  )
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

On 11/22/26 08:56, Maxime Chevallier wrote:
> The problem is real indeed, but not specific to this glue. Rather, the max_mtu
> computation should be fixed for normal descriptors altogether. Can you work
> on such a fix ?

Yes, v2 does that in stmmac_main.c, with the lower sun8i limit as a
separate patch on top.

