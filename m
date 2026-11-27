Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B80606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNMcCvon;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oco3E//2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L68NfkLh2sSnkPajUSfsYj9MfFaavbba0O0y/vWyU0c=; b=HNMcCvonKrrM+n
	NLXeZJ5BrfeX8kdjtSSQssi0I7vJPXdGi+aQ/RZYm5K0a2pfV335S6fPkfAd7vUrLpRL9uR5AuaE2
	SWwEeAngMWRWR6WXFM6+b3i2ckL9fTjD8/3Z33Dnd6CIBGmrqaPt4WsSRoWzDP195yfN/P/aWrGhf
	RpCGWgjokwpeErwAuxh+Vt/KFKtHnurfE3Vj200MSUCrhG/SKaeBJ/0VkN3DO1+X6OuzwtU8x7lfj
	a0utV6kocA3qzckfnWsetWjHHBWcktPy+CZsMY2bx0f0jFvL7AYspILDl+SPhzAcCsxcFadJqeJhM
	PrPthteDdQGpRVFIdPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5DE-00000000BQ1-19xg;
	Fri, 27 Nov 2026 23:18:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5DA-00000000BPR-3OWR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 23:18:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so7106913f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 15:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795821514; x=1796426314; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L68NfkLh2sSnkPajUSfsYj9MfFaavbba0O0y/vWyU0c=;
        b=oco3E//2uR4lUxYmjy6czUDhDjuW6+hkOQx/egG389p9BvAD+1yy4kr6Z4yT2QkZTb
         quivBvxKR1kSMbf9k6ZQR6lLYv3ym8bQ2t0M3Ha5UdT9eMPPQIYlnMMpEa4JmtBG7Pt3
         GF16cfyAcZVwE8AEubVF8guWFucaK54N+OkF+lX2oKpWUUfT2y+mbMsxrz/IZOI9AR0X
         O2G6Q1JBy+B/oHAHJC7Ms+zSXvvBwkJfo1IufrZq7tnCbahLUp2qpZRc0QeMKq86K1D5
         s0FyhEJ875q5CVLXdD2yUsXA82rTEaq04duzZAqC1PlVlrScVNHz2bwgRTaaCZmem+0S
         1VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821514; x=1796426314;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L68NfkLh2sSnkPajUSfsYj9MfFaavbba0O0y/vWyU0c=;
        b=i8zqTQQpmfmKsOcrJhHqAs3npfbbJ57PIbtnwA84XCP6jVqp6gOO5iZ/qUQcszA9Zq
         6DyB9AGJ9edTsK1BcKbzefjufzKnVaWujBG2Y41KhAuhXXWCe2gYcnqXCOxzHV5M0rPq
         YM3E1y9uA7fSmPWzEOptZyk3fI4z14cPsE4Axk/akOlk9S5LMtS2yf2fBgxq+hfFCaBU
         ZmHKWUR4U5R0AMHs2Q8M4kVGAIxZ389lBKceaML2wYWv1z9ziDX4Fw9GSMp3U2mw5XP2
         LIID7qPCaJpam34dc94qn8NzWUyUdkymosNpkfA8mTuELebMRIh4B1trjmmTmqcxw0N4
         j5PQ==
X-Forwarded-Encrypted: i=1; AL+hErHC1P3kvIY/yEKKlLjsbuf76B91jaV1rOGLX78FcGhBCQyWtDO7H94zXi4lxNT30acAk0FtRS8zxGintya9IOjq@lists.infradead.org
X-Gm-Message-State: APuU4Z/B3zNhWKWJEXTXcnoPL3NCykalVAA9hLbTuh+YQi0DvyLT/1+S
	kPuDBq/gDpq06SUFECyB5esbkCImahU2ZajkFrvnMP6wNC6i0CP7AT7V/m4XijPXDvGMwgx7H3u
	EBJ5l
X-Gm-Gg: AZFdTZcX63V/vsNwqVVDsaytbNoVpgjdNi2PlPfSl9PbvdoxD5y2o3nAAtk/nuXU4nm
	ZIYm4zb2J4Lv1rXEkeD88vKnOsbNfctxqQwFDXhSzFJLtLeCk9EiLPDcavPO0x2UMQ3lCJTrtig
	qJS7kbsc7CASsi50OKcDj+GiNCd9SKxJCB0KvRN703TXlpgthYuCZ20yAlcqtjULcHscJDbhdpT
	2/8u4q7wp2FvqjhITLpXiv9Vvee0VGUyWnzg4t9f6+1sr4/9OFJQXYRXVLHIWml50NNTBImYrMD
	EjNyTS4IEfmZS9y6ljBW6bMYpP8bHMAeiFAprSGUb7kQDLIMKxCFKXSv445rxmelYaYBP3+uv/a
	LqhHNVpH+4InLku+Hdi9USTIFtO5hCm0DQPm+ArULoFJTQ6vl5kLALHZSfb6ygPmv8/UPzmBcXc
	NblGdyVmCZIQwW7HLUO8oRewcMkE9IQhyt+kNy5QjtdW6IJOVNIBJ3olxKIGQB8HglBWMiEm/Tl
	GG54OTlE+QfPcQrraObYacSkEwLnqF0tzrrppy6RrVgEhRvxwpjXPA1wbH4fy5h5MGsW0BZwfvY
	AjJfHhoBrsJAHL07Njk5iOKDGG0=
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr33838415f8f.44.1795821513578;
        Fri, 27 Nov 2026 15:18:33 -0800 (PST)
Received: from [127.0.1.1] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm49822762f8f.41.2026.11.27.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:18:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 04/13] mmc: meson-gx: Fail request when descriptor
 chain DMA mapping fails
From: Valerio Setti <vsetti@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mmc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261123191703.179283-5-lee@kernel.org>
References: <20261123191703.179283-1-lee@kernel.org>
 <20261123191703.179283-5-lee@kernel.org>
Date: Sat, 28 Nov 2026 00:18:21 +0100
Message-Id: <179582150150.1958718.8445295799895434689.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=8BHON/4l5h6q1xjm/WKKH4SM6biaPJLVHJzVeZlzOuU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDNlc/Ef1ln9ojoqOfGmv63j0Za3rE67Ytoe1i3aea+zbk
 Xl4U/HOjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEykKpHhv/skRnH3ZWsKxTbM
 FxcprJMXFZi7cAO3n97ixSuES+q0PzAyPN0r92Wbun/44eYT/FZf7qt8Piy7m+G/VFx8vqJM/Qc
 PNgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_151836_939060_D9F38EC3 
X-CRM114-Status: UNSURE (   7.55  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 19:15:48 +0000, Lee Jones <lee@kernel.org> wrote:
> meson_mmc_pre_req() flags eligible transfers with
> SD_EMMC_DESC_CHAIN_MODE before mapping the scatterlist with
> dma_map_sg().  If dma_map_sg() fails and returns 0, meson_mmc_pre_req()
> logs an error but leaves SD_EMMC_DESC_CHAIN_MODE set with
> data->sg_count equal to 0.  When meson_mmc_request() subsequently
> dispatches the transfer to meson_mmc_desc_chain_transfer(), the
> for_each_sg() loop executes zero iterations and
> desc[data->sg_count - 1].cmd_cfg writes to desc[-1], corrupting memory
> immediately preceding the coherent descriptor buffer before starting the
> DMA engine.
> 
> [...]

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

