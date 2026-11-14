Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A59606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CXAxes2r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LuNi5PEo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=; b=CXAxes2reBU1uyWkf4XVLa+YD+
	hvbx7oza0xNlICw2rlB01R3DVYMBMRSqa5iQxWkoDccC1XdqIDybhkw6oF4ZtOABRAAem74tysFmT
	kpV16k1mhWMhG4SnQGZEpRV98xXPP9q8EVgkEAOnTCB6+XkFmjq31KNzQPSw7I0igLmUJha9iRL+G
	BOa8l2PdHLYKArszi4Bu+FwoVZ6cKCDi7Ia2sPZva96TdyCBa0zIVWFFqCYuITIOsxDSZfLnLeVmm
	7zUlKxF7wkM0N6I1Ve9naXTzYS7MIAJ2yE3pV42p2OX3OCXu+aVk17VWZR6aV8Wh7xV56h5gYmN8V
	WE1fQAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5iZ-0000000FPnu-2nSv;
	Sat, 14 Nov 2026 04:50:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5iS-0000000FPlH-3gGs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 04:50:18 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2eac4936dfdso3169075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631816; x=1795236616; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
        b=LuNi5PEorFVVzFzcEjm6Gduh3EuxNqRFxbAGKiJ0bEb/BIyY6sOxW3+SghdRTlDNv3
         hZzBiL5gM/KAqQHOeh5/mVkjDGiWthbIvk5cMzos1HsQKQIf5m0wNNocw5L4UcUFgDMT
         SrP3Kxmiwoljo1eKhX6TRxIGuYPDMNl0Np2v+/PkojYx7w1fPc7QBRGenZkmrBf7xBD6
         lxTUEVr5fsM3TSxejppRmtOlEURotlcWgtjI7wzJs/73cLUQUizrGQ3mAllktPAsUmKH
         SdmKc1CJtJvF8+vABZl2+XisdwsHzrSBVuF1JPDaPfR2ULw8GoXpVrOsOz5lHcrvkdxD
         oOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631816; x=1795236616;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
        b=W00r4Qh5IIXJtdJXxy8LCSRype+9AAFDbXo5BHewc8s+3oQ3NDYIHoZnsIruXUsatz
         cZyFdV28aTUpeIAMJW0yK++igoChvrmBNWVBY86iy2lP2JjgQAJV8LdM2PNng5EQtApx
         8DJ2QDK+R4u6HTzL+QO80hKkEk2KZnFhLvbCERe9dnfIckk07ODz87jFEPSIo6rtUuAu
         YnGf7l6idPTLo8p7lGPMObNKO0MwAwX6H+OnwSRqUP//vY+7p9Ei9j2gwnswdBSNXOnl
         oR/3hI93o3j3CjvftQKCcKtlwDfHs4Z9SQahHOWOR42TkrWBrSkJD5ffzUzRw7J1l18+
         4+Vg==
X-Forwarded-Encrypted: i=1; AL+hErGO0tDAe0Nu93MtbhMGgdLrQ2KVF3VvaAXda916knENODMqb2T9uGKQV0LKbTYR6M4P8PAL8RBu7a84kcB/z3Lv@lists.infradead.org
X-Gm-Message-State: APuU4Z/ygn+kIG3OU8/Iewac0rtSc02DDuX4kryO4DjFogS7vTGjkc0v
	t3jJa2MoONn1Zp6xwnnZx58wf59swRxQjIsMTZ/oKtWmlMll+rIHnVAf
X-Gm-Gg: AYBFou1bfPQMFTP1khRmc2NJi5et5B7iB6ks7YZvAWC0Qm/6zUzotIAN6IQxg4Hh/C2
	8XcwJmmHLadSeOb5id+xBQyzj5ePUIG98CHxQg/Sf9JJX9AIMank+Qi71MBlkYi1hrxk0iLOsIu
	1hfXt3yCNvAWcFagFRsBp7PS+BkFXBKIwNHRCY09xotM9OgZmaqaZBY01p8pqazxaLAESCNlHKO
	AJW6yLiu21iJUZ2niMRAv98lsbuyXC7uA2R19GMJ7AA00mh6iEsGXETIB654oVXQ887p9XWTOBN
	KN2SD3+jFUpaQSPR28ng1suj7JpjgmVtNCs7iO8jij7NYYHXe1LtizC8vApV4oG3c6tsntih0iY
	ZCQgEvI64KmgdpjUIy0GgbHIGqzfZmPGzUgso8Df+ryLL0UCdZMRge2ToT/MZL4BlKaJcuHj7sr
	JXeALmWj+Kg+iU3Zgea7M/isLIC/qP1RdrFNcyhXzOncTirUh+eN8AAzMZoCDdcIMvGcBDzI2QJ
	FPx7eJgx+vqLulQkpJTnC4UouQEqV9k0ElTxwlwQkGXZ6a6uKiyZ9GiGnQXNM61dyxZuMvN+0NX
	JIv3BTEyftcS/jSr0+ddK2IRAPN56NniB+D3Yv7ZWSC3i6qPMTqsm4Lbe5B4SEtWqBxdjJstqgf
	0f2/Slg==
X-Received: by 2002:a17:90b:1d47:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3b1b09f966bmr6902083a91.3.1794631815820;
        Fri, 13 Nov 2026 20:50:15 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm12649072a91.7.2026.11.13.20.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:50:15 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, lgs201920130244@gmail.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2 00/17] media: rockchip: rga: Add multi-core support
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
Date: Sat, 14 Nov 2026 04:50:12 -0000
Message-ID: <179463181227.3521962.17897555296763209132@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_205016_983513_EE66595A 
X-CRM114-Status: UNSURE (   7.59  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sven,

Tested on an Orange Pi 5 (RK3588S), v7.3 with rga/ and rkvdec/ synced
to the 7.4 merge window, all 17 patches, together with Detlev's rkvdec
multi-core v2 on top of your two v4l2-mem2mem patches. Both RGA3 cores
bind into one video node, and 4 parallel NV12 to BGRx jobs complete
with interrupts on both cores. rkvdec runs parallel jobs on both
cores through 06 and 07 (2 parallel 4K HEVC streams: 202 fps against
111 on one core, bit-exact). No IOMMU faults or timeouts.

One cosmetic thing: the core bound first prints "HW Version: 0x00.00",
probably because the version is read before that core is powered.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

Arun

