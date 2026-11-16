Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F05606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1qKOfxjY;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J1mLQN0R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=; b=1qKOfxjY3mB+he
	nKlOIY6oKwzJzPzKoQ9zLcGf0xjrSDzNAQO3zO5WnL/QC6foRm6H72PrdmWBkWL804A/LNQl2Zcdk
	4z1M/Ka80rP3Y/g2XpBb3TYfGdiiEXX9gSfSoDIx9kZZg+hFvo68+HAqzy6Whudq64CEIs/XEVXr6
	yUunAk1q7rlB8fBLBGz2x5xshjiuXbgSEVd+C0kxUW9C8BAB841v3hk0m56BVMId/aTg5T1+YibO4
	J1a/5IYJpY4ahab+OLr47JR9BauMpa4/uSII+bCH3ON2XgD44Be6XMHsQrLWofNiR4/Bwz5tpFxYK
	m1ij8f88k4NaEofCjbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT49d-00000003wYg-3FZS;
	Mon, 16 Nov 2026 21:22:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT49a-00000003wVS-3ti9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:22:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4243613f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794864137; x=1795468937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=J1mLQN0R86iW38MDzWRqP5AThXoykuuDe1xAlUnX5vuuzfUuXrSBUxUGWAPixkIklL
         3XMYOd4fJiy5Gf2oESP/TjUjX7e1L2GRPAC9H3UZSz5UH6+ul+9oKMDAHFy1lTRNtyvF
         P2/9r81jHXB5hKjui6YafFPASWGCv/BSV5HlSDi5hxSo98lHqCHBZGxROMy7rht2vrgp
         CvlUP0TXjvHgh37JPIH0CFKrKLNy4g1tl22qp5r0wLmVoJOT0cNeZOX3FOAxVR4eSSBX
         IHx0cNxeed82yEWbDKPZyC8Vx4Bqi97dW9uOTs1QFX1RMpU8f9lqHaVr52BYyIfjF1Kn
         RD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864137; x=1795468937;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=OMkb0++Na6d2ACydEL3q2YBGJnXZRMsZ76xvfzXWQnPK2vxhwQc0kiXkLBBFQdi6s8
         BMBNby0fw6INqWsHwsDwC7HskHJd6nRWlRiXQRDh6Urg+OyD1TGKymI9FlfZMnzSHbkU
         joGiNm3bRs5PQ+kYTgj9W+hEypIPMZivtNWUQ5RuR23dfZpGALmMfR5apr+r7vSiy4wD
         QS01f8g30cyAVz5yZUqNAmrhBd6pErCoOHW6Cb4mURxlkbMDF/Yd34+TOWV20lvCteuW
         XaERuOv93AaWLK1tN9YWrYDwy3rVMPurhUgYWCKYqRvlolZvrJnNH0w4w6XTD5RmFZAp
         QSVA==
X-Gm-Message-State: APuU4Z8USah/pO3RojIogbuYhrYL6I4VJgWOwbWvlrPXYMMQXnIlEQcT
	UutFRwhYm+rmwtPuz7ZpOyyprdz/I06Ok39Aky6dbawNFxqi/mAPlOKa0LKntnmPWFM=
X-Gm-Gg: AZFdTZfqfzut/021QtIpJi8rg1oUF4bCYimHBaECipW6tTFYnXrD+eyv1+K4FekWxIT
	So8jlqDtVCuazY5YRb6CKilpaTxbDp45hj7oOH28VbhHxB5QwOro7MCDRMb/wK1gL/L59A8Vb4f
	G/LIfTmGXgqnlmW2ClFIDFFOyTuD0aXeXEyTVS8cnHoGk77/PKt3wAl7MEwq+xQlbsDIj+usn8x
	IufpghDphMjWT6qWcmFF0nNe69qPC1gMNp2LWfHPz8o0xp6MDHVpfO5Eqyc+PqnVNHX/yGo+0HV
	0UifxALeBe2YH6+ct/IL11358ZvZJMDoJ0QyE9PHBzNp91ppnCPmvC9PHr2kv5RXeM46jgnMr1F
	YYyFVsoVS5eyKI9yhzqqZHbgeSpPJO6Q95lgR53XzH+sGzHlZrAtrvTJxxx19aqHG3+Gej+8tTp
	pdK+yLhb/hI7qifZDbbowCsvld0WmS7RALhX+EGMdkEhFArk7Yv1HSV7R6YVUtbBQofyoUs2FKf
	QGb9LJLLeeD/Mo1ZZ2G1zCuOFlSmLgYn2AARGSVY+cTOuAcmMmR0QMF4Zapjf2yuzdkxg4QBSUX
	rZIvt4wYsrJUZiO4qxUr4ZtIyk+b1zVfuHv/arRC3kRsd2Ie4sc=
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr30296893f8f.49.1794864136472;
        Mon, 16 Nov 2026 13:22:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm23832144f8f.35.2026.11.16.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zhentao Guo <zhentao.guo@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Subject: Re: (subset) [PATCH v12 0/6] Add Amlogic stateless H.264 video
 decoder for S4
Message-Id: <179486413508.1210949.15857134761629837585.b4-ty@b4>
Date: Mon, 16 Nov 2026 22:22:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132218_997724_863A0E43 
X-CRM114-Status: GOOD (  13.01  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, 22 Oct 2026 13:26:58 +0800, Zhentao Guo wrote:
> Introduce initial driver support for Amlogic's new video acceleration
> hardware architecture, designed for video stream decoding.
> 
> Compared to the current Amlogic video decoder hardware architecture,
> this new implementation eliminates the Esparser hardware component,
> enabling direct vb2 buffer input. The driver is designed to support
> the V4L2 M2M stateless decoder API. The initial phase includes support
> for H.264 decoding on Amlogic S805X2 platform.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/6] firmware: meson: sm: video firmware loading via secure monitor
      https://git.kernel.org/amlogic/c/fe6c77ab883ecbbcb2d4731a2a5d883a9efbea30
[2/6] firmware: meson: sm: Add video firmware loading SMC call
      https://git.kernel.org/amlogic/c/a47962dfcc5a924d3b824ec7acf56c0c654510b8

These changes has been applied on the intermediate git tree [1].

The for-next branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


