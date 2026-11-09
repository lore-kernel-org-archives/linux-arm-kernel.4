Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3631606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p0Lg7m9Q;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnhAQr+o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ijwWYpzQDAx+cj1CGF6sEPYVaJ2fNy45DbFhO/CRy14=; b=p0Lg7m9Q3uMMdu
	vgL7qtq2fiRp7mzfnwSaBRyvfeAPI72l1rgCYvYxDFsPsO7mpfCCByVzuDnAscwZOJuFodFc5bMjr
	03AcZTK1G5fXovul4tYKGnorAYM+OeeN8coVUDgwG7FkTGF6oNiBfEGlpn+78cRz3rEebMYZ3gJGI
	2NyIsKYkoY4+v5KeBcon0b0ptqei/FbwbaIx+LeMP4s7RRHPpKCpQtIXLDEb39ktXlQ68rpnouybI
	qSfb6WhBZYuD5Yip2iC5+e+863nRudv724FDH7/mSXC/6b43kecO5iM5VayKA9JNMXjT15DVPW/Gd
	2QL5zGW1bSFE8z98qgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ6D-00000001xkh-0RCO;
	Mon, 09 Nov 2026 23:48:29 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ69-00000001xil-06em
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:48:26 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so849244b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 15:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268104; x=1794872904; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijwWYpzQDAx+cj1CGF6sEPYVaJ2fNy45DbFhO/CRy14=;
        b=EnhAQr+owJ9IGVrVplGTGdjGW0D1nlixzsTkiBinQLMokTRPmQRmcWnE9LtgBuk2D6
         EnDv+qHKT9NiImeDGD2HLxrYRHvawQd+Hk+MHHBzAWn0D8yY3snVH5VVYZXAg1AYqBcD
         d5A+R9VfUzZUXTIa3ohmoI/6eN3JanOhBr9aKaY2VWXaHmRv7gbk6Fmb+7CYbU0QP/U7
         rM5z8VkpQkOsfEtYeQaFOeDqXmgELyMGA2dmKo2M3yfsFDe3gAPr6r8zi5ABRdcIQk6t
         fmvjGiOZwPazufpk0fEZ8PbuAuxa9ZhKJCyAVd8fhF1C4eKmGfbB5clRhmdxsHgpZP/K
         l+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268104; x=1794872904;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ijwWYpzQDAx+cj1CGF6sEPYVaJ2fNy45DbFhO/CRy14=;
        b=sys4kWpiqsiJEiTSEc8dXor5z2iBKrHfuZmGL+9rJQF75Pn3ntCNhh5T6eYrlO7i4K
         R4GJKwysM614V+5lShG0QoxinFDLUSKMWHqcLQogUUKKladQ80OlXxOmhrQcRPuAxmLo
         U0ME0m4LWEi9sy5vvrKnQyoYGpnCJ9Po4c6uQZ1lVQl+T1kZ4QtJFGWbd2iQ9DF25bn6
         b+XulSo3DbPlVLBy9JCZMDfCsW+jnoY0GcjzW180o/vUW5c7xIFcNv2j52R3ZU0WMPH9
         tRnXIs2nmv1PFidoeD4gGOHJn47xGgV8/g/lB0ECe/IIPJ8+oo59Wso5dVUUUXnoOe7r
         SpWg==
X-Forwarded-Encrypted: i=1; AL+hErHWGDB27c4RUN5TVxWa919iJOjquOSx3EGYALYP+nsoo8uZSGB+aCA/dQFGVg1yLB7fN9BOK9SR52KOaLg1S2Sx@lists.infradead.org
X-Gm-Message-State: APuU4Z+/qr3ey0jov/hctQwDzQC4YBRNtepMTomBKhCvD2J7gtgSVCpi
	GcEJ91rmltLyeO7roNpQRK3AreXh2tNOUxgUCG3r+CGq+QUGZSH1+sLfI3ev4vxzRvQ=
X-Gm-Gg: AYBFou1mdFCVVuNDpZplkWyxa5tfIwtppZil3O82QfHoQNv7IWH4Wjsvkrz+Wz2mxVG
	7oaKK6aJqIfmmtIvYVlrLGAOnTwuzxGmsPPGmVSovadwffMeylh/Wtw+3FG8fB5DZC//OXmo4B5
	xAaqICxJs908Anq2EuX//QaanUEjKwBxlfpmsuBa1d/few1cn+exQMd+Y3iZwGd5il8gFuxy74e
	B0MV7vtFg2BtEi+Mc3r9MI3LSOVHERzmjppjVdsmRp8fEIQl69sagyqNXNM0BQJV7+KO8EQ8v6g
	OyAYlBE54BswTrSeqc9Mg+vVjVengMARnQSYF9OL/ZC5Lfx7Ybmrkflps9DtBz3m4Qph7rd7CEW
	5EwGcCwixUSv8KmzziK5+Xna3pZKnjTtbJNifufdru8XFB9e5JnnvfZszzQMSfxbyWVaM742Zfo
	4+eCKl2MHdPgJW8KhzMO+IORDibbxwnWRMXMZOUnxBVeTfoH+9SWly+3vkwJuSi8PGKKlZTLUia
	1UrHloAb8ybOjZvLdtuemAtYzbZinbB/hqJG6z3ot0n45YVooYo3jnAbj+vh/lbq4CttQAA3ixS
	CtuKjZBIMQFa5Rb8qpbpK9vd
X-Received: by 2002:a05:6a20:4326:b0:3e0:ba43:3d3d with SMTP id adf61e73a8af0-3f18c10ea0cmr750328637.9.1794268104158;
        Mon, 09 Nov 2026 15:48:24 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cdd8d67e52esm204829a12.10.2026.11.09.15.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: paul@pwsan.com, aaro.koskinen@iki.fi, rogerq@kernel.org, 
 tony@atomide.com, linux@armlinux.org.uk, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20261031120519.655248-1-andreas@kemnade.info>
References: <20261031120519.655248-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap: omap_hwmod: do not WARN() on missing nodes
 for hwmods
Message-Id: <179426810249.2265990.13290382980271745471.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:22 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154825_072800_DAEDC4A7 
X-CRM114-Status: GOOD (  11.44  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 31 Oct 2026 13:05:19 +0100, Andreas Kemnade wrote:
> If devices are converted from hwmod to ti-sysc, there might be an interim
> state with the hwmod data still present but the devicetree not referencing
> the hwmod. In such cases, the hwmod device data is still there,
> the hwmod infrastructure does ignore that device but prints out a big
> alarming WARN().
> Be more silent in that case to avoid needing putting devicetree and
> code changes into one patch but into one series, only require the
> hwmod cleanup to come after the devicetree conversion.
> 
> [...]

Applied, thanks!

[1/1] ARM: omap: omap_hwmod: do not WARN() on missing nodes for hwmods
      commit: 540f8176aaa989b08eb66e4d5c4d4ea9093c1f80

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


