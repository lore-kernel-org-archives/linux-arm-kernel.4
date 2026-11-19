Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7FC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l0XIrt19;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FNlyaud5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=; b=l0XIrt198CnGS4
	7SvCg4rf+W5s7C9Aufoy1npA9qNtTH0cQhKhaN2Zg5X4hkjDx+2UEgX8VTodwFZLRnCXciSU3slUl
	q2r6TjV/s4d8xQM0W7BMa9mjmVFKRUWlQncE9GxsVsXalFac+/Z+6jau5o6trCKlYjL4aAWeLcoup
	3XlaovMyu3DW0STvb5f+rPqv00E9QebDc5OO5qWZ7B5p7cyXQSYnNIsgbMz45ywbsLAQBycxuRkkm
	cdAd/2/nAjwh34/3s17lofH8D8TixEepYQnkNF27f6FFrI9Vt4PyLWwJXHgaHlw1xWeXeaaPv6mPN
	wltUSrhaY28U2URvKKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Ys-0000000CxLf-3grY;
	Thu, 19 Nov 2026 18:08:42 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Yq-0000000CxK3-2Yp3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:08:41 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so62449fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111719; x=1795716519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=FNlyaud5hNYioQ9YACyooFckitZ/ZcGUQkHMYxO2xhuFQTAuiA4SMaaJ09iiem24GL
         cIf9SNnrZGvjlwIODnmAyqqr6qlb99IrbTzSHHce09hN9EHkElbEc4SiNABSzKoppxIY
         QxUovclt97Qwv9PAB2jnPkbIzjTKJTZ9x9n+N1ByHX5QOA4lqwsQLjamHUuo9a36I0MU
         k64++Y/ADTqVIMREQUzkxUPMbtl0SjlGYrTob9+xq6SLiLm9kNqXZ7zV2Rwvr4m4wZiS
         qOh8PT/EbOecUvIuyxAAR7/iMhHWqwHW0CdR2WDGp2kykAQyxYNID2DgOevqdEa8CeLf
         mpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111719; x=1795716519;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=Tkn5usDN3KoJVksM0JjX/vSMbEhfiFfV/nTWnbVna2UbDGO+Kj+U77PU4luHxnXf8d
         K4oTJP5+G+/bN94OY1XlY+HA2j1ErIz+VY2vA2S5aCUuTSdWoLJRRPeTx3uzHjBr/sS8
         /MGmS80VSKlGD0HXPO8npFPyEaHisbgJ/xhpCejEljKDaP4f9frVaC+kL7IOqnEwZybc
         ex+qvlIHbjU5UkSWt4ieasg7iK2MxeK0XCkIRHn0n3gbkEHnihv5U43NW6kxqJVwKra1
         9MHNKbPrHyOSWrpoUN6DVSi/SlALaD57+EX7EvxIIEGdf3fb3rs/QvMQcFfaSQLiupvR
         8q9w==
X-Forwarded-Encrypted: i=1; AL+hErG/fi0vj0TxactvnLKd7VkCAZ07hNTgyhmLFQ+0dgq2SJr0N/MmBliHvYIhHv2riowIOueyQHlJ1zfAszO9Plsh@lists.infradead.org
X-Gm-Message-State: APuU4Z/mxUdeADDr9XPy3LKf9/fL6ZfJn08IeEeD5kU8YmZBPXo/GoMs
	S1Vfc7lELltdwvtQ2AWA4qEEKp/sI7zkMHHxlDI4BlQH4yOqKX3d7Hoj
X-Gm-Gg: AYBFou2rn5y6fMp8a0MPyMPR5gV9jWiFOdOF+Cn/937SUA2XFlJt/u5CMsRPqNmqHB1
	yhQKVld62fmj+Rwvri112i4875pZrwfDwxSw0kZqTFCSz07SZMzos9yUARk9IpptjupU3iFRr72
	H6iM8bqgVB2nuOofTlJ8hU9p1j1UfTU3z42mfL59zn8nOhjDo1eWfbGOhDI7oVc7mzlYR83ILHR
	5DWnLgTtaQcm737LjrmTgPOOuZS5ZraiO0CLoSdYaEZCqLG1y07wL4va5m/IiNIrG/X/WUClCNZ
	O15AunnpS8xBPZEFBFsNZ3sAO3CiISJN1nBCwtYCiZnSuFh+WRGZ76pd4+7YgpAvMoIsnx+r47u
	g5Ju14m3sBakzjfWUCWushmg+aJqcLgXZsmKjQHaMf1y941CP+8xnmb4uPzlQLtr0znQYi41ohZ
	fHrduzBLpO6BvPZyYn4JkvXfhqCxA9sT1K3JxQe6RxqfUWYmFPDtB8euNS2sHAtosPEo2ZOCcaH
	OUZRfPQcYBryJjqFK2+hmMgiyPeIZ9jzW/ORjYtSfC8h5VyBxLLIrKc6qFp/yPB7DsBiHbCZPFt
	67patjHSy1Bk/bKYHFUBStiSvO34z94dfPGuq89SpAwZcQHWOGCv/X+LIrJUDSeV0+8Uu3oxO4l
	K
X-Received: by 2002:a05:6871:e7c5:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4bc802e97admr436457fac.10.1795111719191;
        Thu, 19 Nov 2026 10:08:39 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm456866fac.10.2026.11.19.10.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 19 Nov 2026 13:08:36 -0500
Message-ID: <20261118-a733-dt-v3-3-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com> <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100840_652297_9CAB4179 
X-CRM114-Status: UNSURE (   9.04  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexander,

> Should the history be moved below "---"?

Yes, in v4.

> Should two regulators and the clock have been sorted in the reverse order?

Yes. osc32k-clk sorts before the two regulator nodes; I will fix the
order in v4.

> Should "status" have been last (preceded by a blank line)? (dts-coding-style.rst)

Yes. In v4 I will put status last in r_i2c0, after its properties and
before the PMIC child node, with a blank line before each. mmc0 and
uart0 already put status last; I will add the preceding blank lines
there too.

Thanks,
Enzo

