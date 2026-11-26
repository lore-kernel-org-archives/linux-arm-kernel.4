Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l4XovAz4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qs+OWh89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=; b=l4XovAz42TgcPl
	FsJiMpM9NroK3BNLOj+WUWuRMs+YKVuSf4bxmJVE6oxiUUKyuAkGMrv2LbkVEHB3J/1mSj2gjec4I
	/iM1SXjs9p08u45HWbEfbbJXN6y0WlEot5QKYOPUVzjGFhHwJzdRsl5MzGvDUzStMSCGct/aIS0tH
	P3MX31i3Gk6uHzEbhQapM6ttPpxc7YpvWa+vVSmDgoS0cTmmT99l4BvRCed3SrzgDuej6vNsp42AA
	BANqdhz1ll3VfbxHjBvuht+/NUYsPW2BIkdu+SoqLxvmSBycNRVmHIK4yDsxNtAsjW6fC+PPQm5dV
	6lA9G2ia5gdQ1X3hYRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZb2-0000000DNgo-2kFL;
	Thu, 26 Nov 2026 13:33:09 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZaz-0000000DNeb-2XPu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:33:08 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-949664ee41cso706219785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699984; cv=none;
        d=google.com; s=arc-20260327;
        b=pFHoMK//EH16SEXUxfCymGMoxGCWHBwjQcX3GPAfqZb9fYNejmmn9DVUdDzrjniOyT
         JVIktOoZNBLzCGjA9tQ4rjEbLhCAS6eIw+CiMcG5X+dn+V/3PCwwD73igyIuUuiPU6FC
         NeCG1TwYdAPbWTZ/U58Zxn+piEuT4b4IZ/rnQ6TmhRUcsdJyM0MS2XhjJ0dSUTHdUtXc
         B/BzMuCijtZm7SH1AkwjjJYA2PPAR6uxqchW7orr2HCGuuD8YKboEUC0mXtWn4ZNyGUR
         BT0iIfmb0pDfoz5im4X9OWDFTOANNt2jcbhRGf9/gihKqI6TYkpny+Z+tl82OIEHNUAd
         3Ajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        fh=ZHyWJoXuEQJEupGqUnJPFbQLzm4LcBTXF5dRm/Senqk=;
        b=kuHLuIqL1+HR92ieto0A10WvGyULsrTKwuAtE4zGFBA5qVPD19CVKeuFCgpd/wXoWs
         n8kxkrIOa+jmRR5I/5cLzcwvTlVGI/q5+xVb2XI/p5YxHkleHdjIfmorDdr6yOp52dUq
         ALE+4gB49YyP5nwv9+YugkF5hLm5VNkldHTvUg32vngvizLFsudnCQEgPhAGgV80EJhh
         fU2VMub5TooPxYwd3sP0njswk3B+Hb6IRotMTLJXdRcuoDJXCdPcMV1kJ+dKafuVEdhx
         R0a0vfxk8XWhAU5ejrs9JvXV+rOPIOQdBgrkx79oz9fh/0P6KzDQlY1xcQIZzeTq9Lgz
         Up3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699984; x=1796304784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=qs+OWh89WyaJVUeLTtLJkpCbESyUYv195MKpJgCf3A+0qcu3x1ZYcf3y9hR+T86WO6
         g3Ex0mIb2R/e4p1YHwGh1g3kkm/7ZZHl0CubBP/wHeS6Qp1QZNEfF2jkW1WGs7DcdFlJ
         OepdqyDS5c5I0BTtl4BazXMLYG83bGbj05YJMPPn+IUPkidUCdbBlL1t50587sOV6zZF
         Z+vCrtBw6+lCayeTgF6L45jautNeM/4ldyb1iqFqmPAMnpWJuKfF3Wx12WgUX5LoxPXs
         Yl5nPYg+qYgeOBt2P5XvGc2muvDQgsbNIvaKZorCRoQbHCC17RFsj95xK9BUOCicv76h
         H+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699984; x=1796304784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=0o3YnsXlxd/Op7cW6gFHtlO8vuBdDjtIfNcrGmejp8x9d2JHmVsZT0jmYtlfN97qP+
         jx7wouh8gn5W/odMIia4en1Ab5tzTjoXCdOmf2O0SXnlAjr2yQkKcV+qJFS3amtc/Ca8
         /bifUcYKSjpK3NEgjiuoA0dnn+VtmOqbv1YYZFqHmN75e4o7kwrY8tR4CYWG6jKjbRbV
         SDwSrfBtRIWzWNB0a96ypleary4MmzdORRDjO319eBTfr8Xs0HyQyo0vsIVeQPDXRGhu
         jva2vG5eF+QUvzjO4Zez1khnsT739/GBGWYAUKL62eNtELcdKdTOfuj0N2V+HS4KZzGj
         p9lw==
X-Forwarded-Encrypted: i=1; AL+hErHGKndg/3lLQsvqLoftZ9jTnn4h4UORFPpsrVECVP4UKEaADmiKKZcb1DFI1KueG3jhsE67mTM2jRUALvVbkeYX@lists.infradead.org
X-Gm-Message-State: APuU4Z915UPS2shVyBIUwCcLLev9JjPS/13tJT7flhSBVI0ZpdcYkSlQ
	0BYAIUfmAu1AaOL409otcUsEHx8qtSqOq/DUvXnZ6UQzhmsvEI+HCdlgLg+T4jAQQegVgSItAjE
	LnjjIDGmDnUTdXcJjKbvmkn2OgLhbAf0=
X-Gm-Gg: AZFdTZd8J/XFmP85ndwLzBS/pRSILyMgigkW/GmHhFJTBVAPi97gUduLSFAQiAZC9RJ
	CO3mdKMNjqcJASQTFBoTtdZPixksRVyeQVZYojnwJEBwqI5j6kqzV1uOXot3dYzxs0uY+rSlb8g
	dXJzPcIFEARC71VQhWdLzr9QqAsqVO0cfptBYRvw4GtDsaiENkhqACVWHTwq39Ahla7aE+yX1D5
	Ew3B+P6DqFcuKZhl9V9oMfJ7kNLS4QdUzXIKlle6ReaJuftlki861Kk3Up5ZgAVjdCgV8iJrJ5P
	f1ky6nkuFJkCsE1IoXiCDOJewttflWuL39HTBkHzLOqbERBFwT8wEpLFN+Ygh2EwH9V5kH0bAzo
	HaZ2vW7hvoiBaBfgi7LcX2wQkq03D9Vo/1+gyEjHTZzFoL2vnEu7OC/URZc2GJWL2LFqZrBugPa
	g=
X-Received: by 2002:a05:620a:f0f:b0:949:57b4:388b with SMTP id
 af79cd13be357-949bab0eb6cmr4001700485a.41.1795699984091; Thu, 26 Nov 2026
 05:33:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 26 Nov 2026 22:33:16 +0900
X-Gm-Features: Aa3M54qjjDisuRhSq5dw0ZTix4ZhcjQ6ZVqggl6dEANkCNo2yjka_biV4TPpkKs
Message-ID: <CAKr_iV7eXh5LjQS=66mfGFA5TAX6Ke_cu58eR89G9+vjCuDw3Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: angelogioacchino.delregno@collabora.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, drinkcat@chromium.org, weiyi.lu@mediatek.com, 
	msp@baylibre.com, fparent@baylibre.com, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053305_662295_519ED50C 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

Hi Guangshuo,

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM Guangshuo Li
<liguangshuo@mail.sdu.edu.cn> wrote:
>
> Pair apmixedsys clock registration with removal on four MediaTek SoCs.
>
> Guangshuo Li (4):
>   clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

As ChenYu mentioned, my previous series fixed these issues.
However, due to my insufficient verification,
some regressions were introduced, so I'm preparing a followup series.
During the correction process, sadly I found and fixing several bugs
in MediaTek CCF, so please wait a few more days...

Best regards,
Akari

