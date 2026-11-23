Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ad7tdc4Y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynOF02+v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=; b=ad7tdc4YQSODvDr0vPMIQr71dl
	m0bGqfE1p2AhoHIbFYwvf4IfTJxdtRslDyNCpISHqlXlV+sBtG6GVYJ3wdXi90rXBmeLQCUWmJQbG
	mRvE3B+BuADY5eSCpTU9mSPQgkvBbuw73N/oaYC8C0Ol9oLbtWSoDwHttHeTucINYQo1rh6hknkdx
	nokHjkIPHiFgXeGyyKdFVN/cgmTREiBWh/vHkSgrCQtapsQcHfwbxoa+wxWSmOIo2ZfGA20BxSWuL
	dGnzvImDwEzgyw8eqrgmqrRacl+QCjZhvTbDWjlo39B1+Ln/1zYCkw6UTUNNY6azYhsohW2PDeulQ
	qkpPR0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdet-00000005CES-035Z;
	Mon, 23 Nov 2026 23:41:15 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdeq-00000005CDd-3zAr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:41:14 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3acd523a802so35249291fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477270; x=1796082070; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=ynOF02+vMqqK+tOmSYRIWIgGC0t5erhIaoyoW2zc4RjZbog5nFE8tLgopnXhA00uPj
         N8pfUUJiyxv1Wm3Tvb2tGPfrdroCTqu2ESiqTLHESRRiC01lVLwBc6p5XjgZQh8oLawN
         IPhYr1W4ujDnsqHPjWmHPOIVQW0HfALGdH32yveu7tT+ajlY7Y8DZBq7GF1l1fS9xB+J
         irZ6cjDmtO3fw+NSvnVjmRtSoiubQgNcZREjeNyKxhpAcmN3eW3KeKth4GyVQaeQS6bf
         nMkK+h89/i93PqnzsUMnXhvtzQnpd0yINzXmhcVFs+tVIps4RaM9bFsmNCYFufNWnuy9
         9BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477270; x=1796082070;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=X/NTAV3m9cFLd4M65tsJjPlY8CqvLlh3yAtFHfhfXdZkNFU0KfntIJIJytIa5fPRIr
         EhROlJJN78CD0zKE8WAH1aTeyU8SmhyFMK+wBnCYzjawWQpxmmBG9mxdzStMChDtPYtb
         Qo3MUrvCs5/YbsIxH+MsnGJTIR2JQ8g1g87I75zYg5oVDVYReHB1BG/a18uAdVlzVuwU
         kTIO1g9ixptwnCCLHCRwN3QrW23GPoD1pcfiH0apBYcfztNJcQXuNMWaVCk1PKxBgzLL
         BYMExkNnfh+kpBu0ObMHI7peRPE3hUCvNSYid5BJM7pH4TmPq9ltftHVBB2UskZ2YuQc
         TRDg==
X-Forwarded-Encrypted: i=1; AL+hErHiLK7Atjk0tZO0F59QaZXrFuNmnyBmGTmyZAPc1ifGQWuNNpb3geYhmRnP0MADuKw23tLkLeSa2onFm3P74srD@lists.infradead.org
X-Gm-Message-State: APuU4Z+R47FCkeCmgxJi2wF/eM5HEH+T9W07RtX6jITf8+Gu1oiB6N8L
	TydH5pkSV/okbqqnoOoyALYBSjQI9zhfLJK8PkAN5B4jMumwy2R7bHeGJl2q0TffSZV2mg==
X-Gm-Gg: AZFdTZecGO6nTHNJnH0Tf0VTfLWKsidEbggLscXfYxvCpD8kjus1Fi+67TohMTki9m0
	veUkOZNpWbvl9RQK5u+tqSMIjjdOH2DSwyxIPFb4+bahXaZr4dHAf+yGPy/g6ciTN9sXl6zrodv
	UWxKDvyFY6j9o7nV964xyFighDIqMZTtfOF/Q1AjkX0h/1DhvkJ6b1uC/hoMtM9vmpim6jRXW7S
	AbLjXEGwg+5c3p4V/aexCXLltttdbb0zLKnCsTnH5Wcij8o30FePeC+/zBE3MoWCidwNRznCsFL
	bYj1Kp2Kv8ldPBG9YAn1p9R7lEfztwcaTMZxypjQK7MU4hC1LXFL39Go3bJriA+Y1ZZgpN40SY9
	Hu5qzVuuh6xidpUUE3fQ5tT8OI25F+EUJp7AE8xrcLCziBpmaEl1hKKO79Bh9qZXz360sLqHsnC
	IVwp4uMB27Gtr9NPMFysnCCawyOh9DRN/zZtRxn2j70Rdrb7YdUB6OlrLze9rxkfvCF2PBlxt30
	YEMDS5liNqjfTlRGMXgb6nrD6mxImWF8E+qMUIzcs8p1+0q66X/g4PB4farK8eZZhqffaLxHYnJ
	KMHTJXzWeUquDm0/yTuM+To3ljnaJClmsKouuLuAVvKVr8Z9yfjR4bE=
X-Received: by 2002:a05:6512:124d:b0:5c1:56f2:fda4 with SMTP id 2adb3069b0e04-5c1bc89530fmr3136762e87.49.1795477270244;
        Mon, 23 Nov 2026 15:41:10 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm3314217e87.59.2026.11.23.15.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:09 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Andrew Lunn <andrew+netdev@lunn.ch>,
 	"David S. Miller" <davem@davemloft.net>, 	Eric Dumazet <edumazet@kernel.org>,
 	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 	Linus Walleij <linusw@kernel.org>, 	Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/5] net: cortina: Add CS7542 CPU network  datapath
Date: Mon, 23 Nov 2026 23:41:02 +0000
Message-ID: <179547726260.3.2509837092976108381@gmail.com>
In-Reply-To: <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
 <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_154113_020777_E4CA02DD 
X-CRM114-Status: GOOD (  11.12  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

I removed both module parameters and the unused internal-buffer alternative,
keeping the previous external-DDR QM/TM default. I could not justify weight
16 with a hardware requirement, so the next version uses netif_napi_add()
and the normal weight 64. The .c helpers are plain static functions, and
ndo_open now unwinds through cleanup labels.

I reviewed the flags against the core transitions. opened publishes a port
under the shared TX lock after IRQ/NAPI setup succeeds. netif_running() is
already true while ndo_open can still fail, so it cannot identify a port
that shared completions may safely wake. Clearing opened under that lock
before netif_tx_disable prevents completions waking a closing queue.

stopping gates the single reap timer shared by all ports. Last-port close
sets it under the same lock used by timer-rearm paths, before dropping the
lock and calling hrtimer_cancel(). It prevents a running callback or RX
poll from rearming during cancellation. I retained these flags and added
comments explaining their roles. rx_stopping separately closes the device
retry/IRQ-rearm window; napi_disable alone does not join a poll tail after
napi_complete_done().

Independent built-in/module ARM builds without the platform series pass.
The revised driver also passed Almond+ RAM testing with live NAPI weight
64, two load/unload cycles, 600 byte-exact UDP echoes and 20 ICMPv6 replies
through the normal DSA path. A separate internal CPU-port diagnostic
passed 448 nonlinear/jumbo frames, including 8192-byte payloads. These are
functional checks, not throughput measurements.

I will collect further review before sending v2 within the agreed cadence.

Thanks,
Fil

