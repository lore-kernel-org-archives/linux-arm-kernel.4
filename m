Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087D960A3803
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KLmFQtRS;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CoU+ooOG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PKEsbvmI/h2yNfkKYeLdhdyKF8D1G+AbgQ3dQC6oEvo=; b=KLmFQtRSCI3e8q
	SyW1bIXqs44i38UENTR40kn9eouEswEaJ6XSm1+SBnQ9XfpyogDTvFXM6Mu09/i4I/u2Drw43An17
	QoLIYhd4TKN1gfEKbJrhCskHHmLx4pbiqdJYDpZ9e6lyrOFRn0bWnfG5Z3VrhoebxTDRUOy7mFj/1
	K2EycI1K10Of1YAt6CT+niw9+1cN20YOSl2W1HOmSzuZ6zXbZHWZWSZGRKYPW49+pMwHu+bHRapPg
	1ebJ9S0+qyi+Gh9i2oV+B28LF/6eur18werc293Ln177qAB/EtgwQJcVe4l6G34YJQfxQzUX1fPZA
	tMivQVOI+VR7LwC+zxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgSd-000000094nG-1fpG;
	Wed, 18 Nov 2026 14:16:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgSZ-000000094mU-4BsB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 14:16:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e3b22e971so536478f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795011385; x=1795616185; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKEsbvmI/h2yNfkKYeLdhdyKF8D1G+AbgQ3dQC6oEvo=;
        b=CoU+ooOGTOPjLPhWdNHLWQUD22JksxzOpRSWS7pwthGWIlTyDjFqC17R3Z2/iTc+C0
         do9Oi21wo5FtNGbxp6AUx9Lh06yIckrN7yeBQimtuux0eKk1phgh3hjayKGBx4f9p529
         OVmd+ciNDU+bWfs3P2dIyIzXq0EYyaCa7QpB514iHPWEBRhsw4rPrG9sS4x9bqAcn1U/
         mE9oKYw0a+UtKvZY0jNuOkuiP+s6YAotZfqz/4Q9uKuHq5VCbGLEETosiGnp4CVWDlsw
         +uPXSMhNkTBLBKS2XJSpBaaS0WXRmsvQLJPbVGC7yY60OwDye+bWHnSY76s8U2PhnMt4
         RObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011385; x=1795616185;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKEsbvmI/h2yNfkKYeLdhdyKF8D1G+AbgQ3dQC6oEvo=;
        b=llk6ZEAtDwDfKnUMWdQV6JVtpE6PRjztkgF05QpQZrRNSy2ofJTWpj6zIzTXbSOr+O
         0gaWAOZ5GCCmBwOcnC4RpI5KlBE8vSKxVvdLSN5cZktIfOzBMLjvkx9O51t3pGv1RhrP
         n15C+NZiXWjLPLVQ2hT6tdr9Jz2PyPco3WXG1HJYLil/Ql0sXBKVFxnNnaXf1Q5xLXgV
         uEQfZEYDchv8VvCB0yX2F17TcUuULjz6ZQD18xDKCWxFjsygvZgbAB37qgEgoCLDSRfM
         8g/i6CeZuEZtxAWbGpop6Itu6BojWv/98urBISbT2Mb3TIpGo8xTqIba/qTDwosCK0V4
         mOYg==
X-Forwarded-Encrypted: i=1; AL+hErHR2Fo30Anl7osLS4xckCTFwMOFUYAeAtnRO0QvvGBwsokwG2YG/aJsDKIQK8XVm1uj43cMBVbBxfLGFZWQB/HM@lists.infradead.org
X-Gm-Message-State: APuU4Z/szO4lzzFMYi9ztAa4O9hN5vY9IAFkqtEIzeppnjyxeIJ7zlSL
	ED3zekhdP2K5GzoiRanDVsLgC5rmfuxXwFvyGYeqA94nmfiHtJTzDGtya+k3cL8iZ9s=
X-Gm-Gg: AYBFou3R8ndt3ozDmIxfrO/tXu1qyxd3iAxE3E40y4L564LYX9IHUABsOCSO64PnRyu
	n06UczI7zy1BkC+vj3ng3nnzUQ0xThPU7chjQKShYiuBe9nHLjIFjEStfz/bGFy+du4vs2qu8BA
	vbNdp5LVBGLiMDFDlWTKohLlpCavzVoXgxcuQ1G6wTBdrkBbbJVeD9RQQAsI4OP+r3BkvT061CX
	HYY8Jwb4TaWMEcqlKjEAbW6Sts1yDyjMiYWSikkY/Y8irLWTbSA3KLLEyv458nobGmS+NmiTtYM
	JABdIAme+Hwa3UOziJbdSSIMdtEqGocnG0PH1WOVFE16pB4vT0/B5yuAFQ9Kz1WpDu9MGo8i9j1
	WGWMxx5hTgxGcYB+Pq5I2UiO9gmY65rsW1iyg61X+vYOA8b3v8qhVh3hmN2eIYOSIiCiNtBVicC
	S4LHXvAAwdrtPgByp1ZSjGrKYPSG58uZM4Vf3bAPafWK4pQbCa8AAgF+9N79VkGIenJIDRtIn2f
	TlQpn0loozAp0AK9+XtuWJfCrFDnlmsWTb8WYfOdwCbJXYX8Ulte1va24B1PE0t3K7zYeH/GEz5
	dwQzpIFfmPSlmISLpFHkwuHS5idMpHtac35mzG+p7kKIF5tEJggdJ5XVSEiphtTSijpUbWO+bBi
	IIMZfzFoLkZlpjJndHYCfVwfHmsvEO1h033Fy2yG0Yff8FziMn1ugickMrVZARpgg3qa+68A=
X-Received: by 2002:a05:600c:19d0:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb7d6d1de3mr52112595e9.4.1795011385062;
        Wed, 18 Nov 2026 06:16:25 -0800 (PST)
Received: from alcachofa.home (cst-prg-52-235.cust.vodafone.cz. [46.135.52.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm146337145e9.14.2026.11.18.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:16:24 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: (subset) [PATCH 4/4] MAINTAINERS: accel/rocket: Add rockchip mail list for rocket
Date: Wed, 18 Nov 2026 15:15:23 +0100
Message-ID: <179501127061.337132.729815382590515286.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814022453.437-5-kernel@airkyi.com>
References: <20260814022453.437-5-kernel@airkyi.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_061628_043226_BF70A0E4 
X-CRM114-Status: UNSURE (   8.24  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 14 Aug 2026 10:24:53 +0800, Chaoyi Chen wrote:
> The rocket is a DRM accel driver for the Rockchip NPU. Add the Rockchip
> mailing listso that changes can be tracked.

Applied, thanks!

[4/4] MAINTAINERS: accel/rocket: Add rockchip mail list for rocket
      commit: 20f0d3fdc8f51ff89d23f107bdb66db03e2dbdb5

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

