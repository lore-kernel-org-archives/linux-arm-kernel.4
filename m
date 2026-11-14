Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D0606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYXN77P4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQF4+ERx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=37e47cL8nK91UujMUai9IjESXvG2R6mAt8cHf2aHgUc=; b=vYXN77P4XVUxnW
	x1scm9CGoHIGqcwVKSYGYsSoNdR0yNTjoz0b0ykoAAFwJgtYfFKddm2BxnyuQE1fbVd1XlIt+OU+S
	aOq/KrESygbKmqXWBcxjsgQIN6HNLvRROnQQPQ82WknhJ5bH3qQLr2IP2sA04wT4zOJ9EX9Laf+HA
	2tUdPKbu748CNmG8dKZwlsbChUJ0t9rGaEwamOZG336rz6sbsou39CpEoGepsR8e9kUjuHAT4XJtQ
	29oO/iN7kctH7jORViKTBk8WvDOO5fHMQO5XR2QfGbEJ6W9oa+zOqWu85U2SCa2ufYRHzXDXoNewO
	Z2XF/hHaVwoU2QMOj8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAJy-0000000Fh3F-2Qs1;
	Sat, 14 Nov 2026 09:45:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAJw-0000000Fh1u-0ixS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 09:45:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11185905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 01:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794649514; x=1795254314; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37e47cL8nK91UujMUai9IjESXvG2R6mAt8cHf2aHgUc=;
        b=xQF4+ERx16nd7hU19t6OwVCrRa2cIjjAiFeQ0cZv0CsszZbHR7lGWHgsPldbxOvS59
         X49rZ1VBTUVgHsQeid1TsUlCZW0Dlr95AFBp25U/f//4+lxbAYhkP9yY5o7dzv/4Y07M
         WnGjiHiiDqwHQKZDsleOidrO5juw1jzA16vNgzfweIqurCgTJgQmXXqrVLphqQZY7QgN
         fAVa5Rwa/nwIwVezeWCX1qy9W+XM6rTOxQvCg1u+6Hz5j9eXEUFvP+Ki0/hwba32hR37
         en3RbN1kLTuVomCi4KqenvYW5yQkcYQRUXsiNl2GoQiiZei9oeaMdGJz0IyW11tc4nge
         xhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794649514; x=1795254314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37e47cL8nK91UujMUai9IjESXvG2R6mAt8cHf2aHgUc=;
        b=YZ/kUSK+Nmyz9gJoMGIuijGD3fCN3BEX+FDA+V7qqN52U65FVg8gy4AX8Cw2+E3Rmy
         8bktj4qkFz3vXfmJU2nSNGtb6z5ANwqJEOhkIDHCEmIxJL4r4q7h6w1MiFhxoNSnMuo7
         t18fE8TwnZzW3Ztucnms6VXDumeXIM33tNVo+BzDYKNNF9E3ud4il7yOlI1RWy/H5KtH
         dHdSkDIUi87VDo5zSeqdiaGKMInJZqlYvbO4GnLx1JdwXYi3Nuq5Sj+YSidc1DuYBokN
         pT0vZrMBckvzcM8PICA9rejAwKxz+YpGlq2mi4acEun/UIaPzYuNJVsgOuH5jKEGyKKF
         W4uw==
X-Forwarded-Encrypted: i=1; AL+hErH9/6TP1iW1YY48BsnN1Se/HMQoOnuaB6PkkSwkX1kBluuaRlQ82Ky06CfuUALPBVehfrFfK02oEVhWtxJRNmdW@lists.infradead.org
X-Gm-Message-State: APuU4Z8aJxDerdWIDbG838x62sMZvqjXBBG6uGh5Pnikprgo7G9Z4ma2
	ycVEFxsgzZgeuv8D9/ckO57D1ffFcut/LQC+dAH5mBAFkDIz5QFyUWNY
X-Gm-Gg: AYBFou3LPRQqzZ1sVVEYX936QQDMGBccboSlrDT2GOdF1cikyfbR+bTFgA9oX+ZK98w
	BizrBEl4jdV41REM78INvinwSgKBkbvCISxO2N6XRKeo4nLvIccobR8c9XbkFKyJRMLmzcC7Vs7
	qS3JtWLbNN/hDSbCF6HPB8KISUMnxhty2K9tXxfKzW3LX3xyRakjxNYDwcX3e3WM5M57cB8L/ef
	r9rMVTtcul70blCZH6BcEQTB76+32e/kvJG+uU5hpPoqUI7UpjIPKJSlAUBbmUS2MVZ4aCy2hWc
	CdUTKdMeHOgakjRo4bdBaRIAjQ5QDpExlLPZ9EZTm+VyJbHT0J6UVyseouFN8ZCrqDLnskAfGaw
	W46PvPQ7XLh7q4/l1Z7swWKIzZmrGlvia7x7CWzK7HPnEuljofyDGUajH5HDefwDWxBpwGouGbJ
	pycTnLpoFUXx60r7d5qGoAt6Bwywe9WmW1MCprsofb2i8sfJsf45KgoxDlf4hSc0vkLeGa5hbj0
	UViIGpcUmLrsiiVV5n4vi9JA/6uNOr15boNO4pEnaqqvK9HwDUo/3TUnZ5+CBe5iiXnOScgFhDd
	9IVWTsT6q0o2fiYfvV4OIBglwaU8vLxVQ73UFArv/Z7X0Dmmc+4huwjUw5uktKTRL0CFzbWcvHI
	=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr120286225e9.0.1794649513834;
        Sat, 14 Nov 2026 01:45:13 -0800 (PST)
Received: from vlw-PC.. (static.18.103.245.188.clients.your-server.de. [188.245.103.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm45787065e9.10.2026.11.14.01.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:45:12 -0800 (PST)
From: Vladimir Bely <vlwwwwww@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de,
	finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/3] pmdomain: rockchip: switch off the subdomains of a regulator domain at probe
Date: Sat, 14 Nov 2026 12:45:00 +0300
Message-ID: <20261114094505.401228-1-vlwwwwww@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615323.git.gahing@gahingwoo.com> <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_014516_230671_7A6ED1DB 
X-CRM114-Status: GOOD (  14.91  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 04:04:59PM +1300, Jiaxing Hu wrote:
> Mark a regulator domain and every domain below it as off when it is
> added, and once the subtree is complete, switch it off from the leaves
> up. If a subdomain fails to switch off, leave its parents on and warn.

I tested this patch on the board I reported the hang on, a FriendlyElec
NanoPi R76S (RK3576), and it fixes it.

What I ran: Armbian's 7.3.4 edge kernel (armbian/build main, which
carries v14 of the RK3576 NPU series, so PD_NPU already needs a
regulator there) plus this patch as armbian/build#11366 carries it.
The code is the same as this 1/3 (I compared the diff). I did not
test 2/3 and 3/3 of v17.

DT: the R76S DT with the NPU disabled, i.e. no domain-supply on pd_npu,
which is the case that hung. No regulator_ignore_unused, no
regulator-always-on. Serial console attached, warm reboots, PMU read
from the regmap debugfs about 42 s after the kernel started, after
regulator_late_cleanup() has turned vdd_npu_s0 off.

Without the patch (Armbian 7.3.3, same DT): hung on 3 of 4 boots; on
the boots that survived, NPUTOP, NPU0 and NPU1 were still powered and
not idled while genpd listed them off.

With the patch: 11 of 11 boots, no hang. "vdd_npu_s0: disabling" is
in the log on every boot, and every boot reads

               without     with this patch
  0x110 req    0x000013e0  0x000013fe
  0x214 pwr    0x0000003e  0x000001fe

so the three subdomains are idled and off before the rail goes away.
(Bit 9 of 0x214 is clear because the GPU is in use on this board.)

With the NPU enabled on the same kernel, rocket probes both cores and
an LLM runs on them, with identical output on two runs.

Tested-by: Vladimir Bely <vlwwwwww@gmail.com>

Thanks for the quick fix,
Vladimir

