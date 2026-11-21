Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C46606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cETkDVQN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jK6fVLek
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kVw6GMeWVHtwp4C/YrzbIL6SlnpGcWp+X6aGpcy0sFQ=; b=cETkDVQNTRkvGr
	tVWydGj5l6A8qm2AOQAJqmC4I9DIu9QjyVU6ms5GDYMqbLlIkmSdJJBWldfKNYUyyQaCbB50j1wtf
	BAxA3IZ8uLGxZC2C4eTUd+Hal/AoOgUGjgv06KK4Fp887rRK+uULV1NGjV0/yOHoGxR0LCDVADxla
	e/K2LUSz+JLVKpGDv54Ht2uT1YRoALZ63rGcBhfoQWrDDtcNJeFPSrryK2pi2UfndAZz5Z+dJLOE/
	Tg3Vhz3sr72HgILGvk/N7IlpHhOd51JgsiXv8GxWxMylTsYFUlDl5BQ5knUCOnihl79G3y0YcnYhy
	Inul49a4FZ9vtMGfkclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiMO-0000000H2HB-2ikt;
	Sat, 21 Nov 2026 10:30:20 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiMM-0000000H2Go-1Rlu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 10:30:19 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3adef977ad9so13624801fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 02:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795257016; x=1795861816; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVw6GMeWVHtwp4C/YrzbIL6SlnpGcWp+X6aGpcy0sFQ=;
        b=jK6fVLekPZK/RFv0M1aRwGzSeA5i+fBzULMoYcwYBviaM+41WVlyiX8JcEmrD5joCN
         /RLBFKgXfbpLZ7mm3QmiFR1vhT/cRMzD/L2XvHUaPMENzuqfrDzooWvFrcCEXDp+3Mcv
         z+NPC/fohpT6YBFPKWQ+RKiXdA3jgdAzJyh2cLrwH9Oxi+ZK92lk2JdPkiQDfyiNs2EB
         eyXIDcnROJzR2L/+CFGGA0GRiLjabgNEUNSh2c/bXoUTMh3imCdMjiDom/bOxeqCQpz9
         KC0mn5JVXyD1A91NJG+MJ4pB4jJ1uz9Sm9KNvAlu3SiYudWYWh3wG8tjxZF2b0Q7IRoC
         6ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795257016; x=1795861816;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVw6GMeWVHtwp4C/YrzbIL6SlnpGcWp+X6aGpcy0sFQ=;
        b=dM4dN+YXFap7MX8A5gyFw/d7eWUN6eDb7ShwcznFITeRVv8DQWpGZjLmKZWtOiA7QJ
         DyAZz+yAbz+kdXr6ceNZd3Vpiap/Wp+woRRZUqDENsHGifGGsYBA3mv2ijGvEj10DFaI
         8jWKsgJb058/OUPm19jLYvKRWL3sJxa+CuFVvXDhTLzJqs6RdVT8thoQlFhVz59T+6hL
         PXLc11RSoFJIlI4tAH9p2xjLridEUV8Eiilkr89/hUS/TxqMpeqHGUVZxKGJYkAl1CdM
         IYNmHJW0Fn1yAF+6nt15kGod0ub/rQ98JZNYnookYxR3RSsp/ZcmJ0hRw4MGhuvWzBRp
         tEqQ==
X-Forwarded-Encrypted: i=1; AL+hErG3vDhCyfdzdWYbzXFrBDNyaS4bnPia/CfDo9HHsSP2DWsI7KdOwFLQ8BL6k/dS7Gz1vxYZbrdUw3skwjufkIzK@lists.infradead.org
X-Gm-Message-State: APuU4Z/6ZBlCZwceOeqigFoB/6qJJ06VK6VlMjzHnlWtjEC9i1wnpjFp
	aiuusMSPk/WQ8tabnHyL0eeGscjCS+kjnjl8uzrE0OrtIcNwYqPE4QRS
X-Gm-Gg: AZFdTZeyaesJp0jxlTvVyKJFqBjrhz9HaSxBnH29JJCegDExbQ+9PGF8jWvqbizJ0wu
	0GQ7c5W1CwhlukipEf4qATENK4TaRx/0Hl/KtBLWWcmQ8PFmPCDFABfmID0o6CvmlkelrO4STmy
	Wu10UPR38b4QRU7xKzbq6afSki/66vdUdrNdp/39vIOYXLZYDgeo3resVnpS9O7cgUw/FKOsTkP
	U8MFus+wv3p/xihSf/u+gVzzjvyQbY04i9xw5MtWOOyFeipo2vE7U++LjWtAcVVtiYE1RGT0EOi
	ByE3dGws7YzCxRE1nn4oaEc6VKtF7Bj0c1kPNe+LBALn9N1LNThuHP5qV/e1mTo18mdKrVhaZ+R
	hAsbkGCy/zijswadItwXM2ieJl6GhbMKpXnA4BhMoLA6kpBIhQvKiAEw8wloEaKaRFulTVmgnlH
	LhWoJjnmwmeunXcCUe7Ro/iZOOHw7Fn737evETW9lLpPlAOGBF8FAAt54i90hgy6DjG9dzpfxS2
	VE73DKxax4O5Vf3NNJ0mxm7K2uTvk+ChezIkPl8Qb/gpPAUmFGAyUEEu0K+Cx3nW/s+feUMAkJh
	n1x37vgcB9evU7cagX3rMoguHWNC2Y22aa0NbMB8BkbTwCrRCCUSst4=
X-Received: by 2002:ac2:4f08:0:b0:5bf:db9e:426d with SMTP id 2adb3069b0e04-5c1bc8217ddmr1883998e87.34.1795257015698;
        Sat, 21 Nov 2026 02:30:15 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171d7sm1257891e87.30.2026.11.21.02.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:30:15 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <377b89b7-90a3-41c9-88c4-fd3393055f91@roeck-us.net>
References: <20261118-arm-twd-wdt-v6-1-ce5c85b45c63@gmail.com>
 <377b89b7-90a3-41c9-88c4-fd3393055f91@roeck-us.net>
Date: Sat, 21 Nov 2026 13:29:42 +0300
Message-ID: <179525698278.4.12784611811620173233@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_023018_436275_669F5DD5 
X-CRM114-Status: GOOD (  14.18  )
X-Spam-Score: 1.4 (+)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 08:35:52PM -0800, Guenter Roeck wrote:
> One possibility might be to try cpufreq
> functions (cpufreq_get / cpufreq_register_notifier) as fallback.

Thanks, I implemented this for v7. Since the CPU and PERIPHCLK rates
need not be equal, the fallback first measures the watchdog counter
against monotonic time on CPU0, then uses cpufreq transition notifications
to scale that fixed calibration reference. Calibration only reads an
already enabled counter; an inactive counter is temporarily used in timer
mode, with its original registers restored afterwards.

The fallback assumes the PERIPHCLK/CPU ratio stays constant. Platforms
with an independently changing divider still need a clock provider.
Actual clock provider errors, including deferred probe, are preserved;
the fallback is used only when no clock is supplied. It requires CPU_FREQ
and an available CPU0 policy, deferring probe while the policy is absent.

Frequency changes reload the counter against the existing deadline, and
the maximum timeout is bounded at the maximum hardware CPU frequency.

> A MAINTAINERS entry would be preferred, but is not mandatory.

Kept the separate entry.

> I think we can call that on purpose. Maybe add a comment along that line
> into the code to clarify that.

Added the comment and corrected the commit/cover description: the device
PM callbacks retain the deadline, while the watchdog core's explicit
keepalives before suspend and after resume refresh it normally.

Full ARM GCC and Clang builds, module/modpost checks, and a GCC built-in
build with CPU_FREQ=n pass, along with the host regressions. I also
retested the exact v7 driver on Almond+ with PROVE_LOCKING: takeover,
CPU1 ioctls, timeout reduction, keepalives followed by expiration/reset,
and restart from CPU1 all passed. Those hardware runs use the DT-supplied
clock; the clock-less fallback and DVFS are covered by model tests only.

Sending v7 separately.

Thanks,
Fil


