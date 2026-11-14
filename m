Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FEB606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nMwsUjg5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEUdNnF7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zLZrkub1iNWGcsUrG6AoUeFQUZNpk/XAt3E+7j4A0WQ=; b=nMwsUjg5WiWZdoH0LGjkcPeJRR
	7h/bBMOWbVqV07C06Sj6qnI1LFv2hrYY1TI2WDP5KAXsaBGNR16GiVZTqJ03VVkpOHmNXaSieV9/L
	B9hOBdVGMR+rgJppLI+ihfPHNooAegBwMM1WGCjnbX0YJ8GxCwp/A6Y8ZN1ys74S5th/3FluT+Kkd
	4pUFLHwnYm9exXf3lkmL1/F+LLL5Y/dFumoKE/ZV3e+N1owEoqTv7hb5U87FYFON2h14ksK4b9aPG
	n41nTV7ucMiV+tC+XjAyv1T1W2hNV7ED8wzdU4u7F0KP9gobRsY2Xz8wxCaPxYJkZ86/3oPDZNJlg
	yRKg9thQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIrm-0000000GdUD-2Qrx;
	Sat, 14 Nov 2026 18:52:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIri-0000000GdTo-04tl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 18:52:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so9916455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794682360; x=1795287160; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLZrkub1iNWGcsUrG6AoUeFQUZNpk/XAt3E+7j4A0WQ=;
        b=PEUdNnF740yL40h7mgn75gbHvv0WSaly0M0mDwIJsLJvykli0qCcwO2bFxtyO+SsTn
         yKrEH+4nzWrKBAZdciGLJrrXK12yTy2zwbRqdmmtYGCnBLdkACM+Z0x3qt+VDRoWLe25
         oPaDp4jTXFKw0l4MUrCJRBcw4XpHufp23d/2joTJsARL+NNRQpLMAoHoAWIHDjDNNe3l
         Tf/vMVV1F6nXkN9Bu7CypeDU20Jd5FJTYRPq8l584LSS1yd+DAve1EMNdu7bzduk5APG
         KzCG6LC2gqHqqiJ1Adu+M22eHjV9kFWomclWya0+Rg4TZBZK/v4Vm0HTZQHxR3HkvoJq
         SAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794682360; x=1795287160;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLZrkub1iNWGcsUrG6AoUeFQUZNpk/XAt3E+7j4A0WQ=;
        b=zpezVIiKDNBlNK5YIHKjGvkbADkyhAMimlSut7j7avbY8dHIIezGtYMZ+808japJGv
         5dgIQVird7gLRUiLxXZzkzzdvpMyiJwcqvwM5FCecpGZOCAqlKBmkCejbw7WC2eoWdzb
         1/5E0A41+m+UiNFQ+ccP6aqn7hhLYWtBqlfICzxHP0K2CU8z1OSlsB3B6H1zD0nVbIzI
         QILoUFNBu6RmudmskLYBjnMC0bK4VDG8r9wFNek40Qy/OFHrCmz1pLkPCbV4T2NgLfX9
         EfGItfm4tvsJNsBt2J2PQHE3oZ9NZ9CwqeO661Te++FrBnuo5hwTQPTAQJzQzBsqJTGp
         JghA==
X-Forwarded-Encrypted: i=1; AL+hErFZlxmd0yvUrh99wS2Tg8FTX7jpx5u0Uzlh21Hshzl7u9SfPnT9AqfryYO5igx0+8h10oJkIRVEQsdybDZSAIg6@lists.infradead.org
X-Gm-Message-State: APuU4Z9Dp7Q+LjYl3ELo7CcRM5VRIxnDgrxgjFPSz3E69wDiSVkEP0E8
	ZVysOpDJuSvc/sDpeLgjRGiBOLFD6AJLpts/gmQLc/YKNZWDvPL0PbQn
X-Gm-Gg: AYBFou0DarPrnJYiCi5TULexVzbTZnfnBzQqMEB8VABNeOP3kAQNVM1EQdep4XrBp7o
	hu5GmlZz5YsLYQAbGl+iYx8KM1g+LXQr9VCaE3uOHg3/8x0y6bCp3srSkNQKFAG9M6vC8Kl7J3V
	kYhIVVzNpFyFx9fYLyMRvj5Psc7gJlB9J1JajtNEsvKnGzjNCY3Bg4iQLs3px0R2GxA8a0707M/
	tsvlf8wJ7+UB/GYiqBqIXhw16msr3bS3FEKzQ6Eb+eyKIbOHsl7gGMscOTGbfRq9NeNU5Bb0/9M
	p2NTGF2a5KT+C1Glpy2qM7K1x9C919e5Xs/QeBqU5DV5O+mO+7bYYsIl2Y7Yq/JU5hKtCxaFy62
	gVg0J5zwo0kDMYaZx3ZFQBAH8txhziUC/8HqTUDVkUQwm5AuKa/3sfQ56g7h6oijm5d+Ye8MwqQ
	4puLxDvvgxxBAp/wGJLDTFKi8yoi5jt57i9LaQZLYIij5dVhybNx9P4loS3fK5WYYz3GRYwXQ6r
	jfSMo1DhbsasaxOfaZu21Z0D6NnXKw/QSc5wubTUR448nPUWLDnHv6kWnEwoswmNgZIeep9tEkk
	j5umw6Yixm8lcA1RsDAR3czTTbPqlXJ8UQTdvm3v8a/IdLco0Ujc+H4=
X-Received: by 2002:a05:600c:a14:b0:4bb:6994:abe0 with SMTP id 5b1f17b1804b1-4bb6994b7eemr9745705e9.1.1794682359704;
        Sat, 14 Nov 2026 10:52:39 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm161858265e9.9.2026.11.14.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:52:39 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Russell King <linux@armlinux.org.uk>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <db3a09f6-a560-4522-9954-8aa63eb2d5fb@roeck-us.net>
References: <20261114-arm-twd-wdt-v4-1-5a3104b36331@gmail.com>
 <db3a09f6-a560-4522-9954-8aa63eb2d5fb@roeck-us.net>
Date: Sat, 14 Nov 2026 21:52:32 +0300
Message-ID: <179468235262.1897695.7261271002700550095@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_105242_081541_3ACFD444 
X-CRM114-Status: GOOD (  15.88  )
X-Spam-Score: 0.4 (/)
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

Hi Guenter,

On Sat, Nov 14, 2026 at 07:56:12AM -0800, Guenter Roeck wrote:
> Watchdog drivers are supposed to watch the system as a whole, not on a
> per-CPU level. This patch goes way beyond the scope of a system watchdog
> driver. Per-CPU watchdogs are handled in kernel/watchdog.c. I do not think
> it is a good idea to overlay that with a second per-CPU watchdog mechanism.

Thanks, understood. Watching individual CPUs was not the intent: all the
watchdogs get the same timeout and are pinged together from the ioctl,
so the driver acts as one system watchdog. Going through every CPU only
follows from the registers being banked, and it is what made the driver
grow (hotplug state, CPU PM, the races Sashiko found).

The board needs one system watchdog and nothing per CPU: its boot loader
starts the watchdog of CPU0 only, and the SoC has no other watchdog.
Would a driver along these lines be acceptable?

- use the watchdog of CPU0 only: start, stop, ping and get_timeleft run
  there through smp_call_function_single();
- no CPU hotplug state: on 32-bit ARM CPU0 cannot be taken offline
  unless the platform allows it with cpu_can_disable(), and the driver
  would not probe if CPU0 is hotpluggable;
- the watchdogs of the other CPUs are not used, one found running at
  probe time is stopped;
- keep following clock rate changes and set the watchdog up again on
  resume;
- keep the restart handler.

Fil


