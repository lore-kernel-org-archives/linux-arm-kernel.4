Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45798606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yCN35jrH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kV1dk0P5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=; b=yCN35jrH9AG1ow+sfnoMn617/4
	45Sm2BoVy3FQ3pQP6hSJJ1+9RA871Dmz1Tn+cyfCwdSgMPS7VZd/xUOerIznd8GEKh15p4S5u4Uul
	z6EyyswSeSPoNU32d5Ky62sZGhoHS5wsPh2Ip2AowIXtQGTBF10rt8LCyEmdSV17Vs+UL+zd77NbB
	gt1TcVlT4qdyjksv1kszpI1dNn76xaRpBBmgDU1KL1uDclZCs4qz4ggvgQp5tBuJFWC6mpg0zuBWF
	oioTPKDniw61kPHPkaUAU7QukfdRLuPxGX2B2k9BSP94YYyq00baXlEGB//zyY6AJnRGq6HVVe07L
	O1UNHIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz0L-0000000H7WF-22aX;
	Fri, 27 Nov 2026 16:40:57 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz04-0000000H7RN-3dJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:40:56 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cdece95eca4so413857a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795797634; x=1796402434; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=kV1dk0P50TRT4xu3MrCtRkTO9Q/RGn8Qu4uXAdTezzZkT+0c5OL6gwsKzALlA6VaDs
         GrEwxLs8zvTTBTll65RAeKrBP7hg2NIDFOFGQ+RMBRfnmNrK9K9fliKYPdIv9bsICulh
         D+/UweuoanNPUWLtEUhzPiUTwLcOgkTkZzdNN1qh77h2QQboReX/fd6cJpIQg3exz0zd
         FJwClfjUAtyAUdUBihNwj/6xJ1gBDwOtQyrDEBVHVvHTjqWOGvMLFXeBrC1v+Uicq0oW
         S4+sT+h9PP09VuQ11aip3XknKdULmXW7edjA8HZTHBju1yD+kYNgP3lsy4oyatGSa46X
         OIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797634; x=1796402434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=aGfn+MRfNyXa3O8uuJQx3eUa54a9kbTbn7hU3AuygdbDxC+QlFTlRYfKm48dzVrKI7
         +83BUYzPNrXJVjiJyG5j1Y0Zpz+R2HlFVnMjEm+Ar8r3bCPwvUlF0VdpB/iO43YRSR3E
         FSx88QSgZGM0Z0t7QK6wn2+ZF/F/Mx4PkChJk4cicMjVTaoQ6d6Y8eE797ygi6rm6FKI
         nq76ngz9nDOq2qqhBTHpRzQlsJ6dZnX7NZ2whwY0WrD/RrNon+GCpaQY012YStb3Uwmg
         HKMWQ/R1tFXKQ8HRh9iTf/H3CfgVUBuatQPYjJolSyhOBfrr2hInc6QtFxBRkqg0giog
         9shg==
X-Forwarded-Encrypted: i=1; AL+hErHJ/btdGHM0d8WLzVgbf2uYHmE67ZFsyp/qKdZeWr8Fu5tcnDg5YSSXL7NBCySJE2FK6ynK75CjcesLRa3psWBD@lists.infradead.org
X-Gm-Message-State: APuU4Z8flRUKY0o3kK0ZOFTuZpyQeCA29IwfO9Zu2K9x9Ofyl7Ief+e9
	ZFspQ1ovriLhbLlWqEt90FtX2fJJhvxrnLjDSxgVzAQOxAEG6y8eqfVXDHhGl70fb7M=
X-Gm-Gg: AZFdTZeqCAgyqpHaupWF2kAZ/RYTTQGszJ6iyOZ90zqBI5j65XtzBIyHdyPUiwakecg
	pk2qySQW3OAK6bkn+d6/QY4IGy6DCy6+0royOTefKSdHbbyhxktzJpoF45oZo2c0dScbuRaaXRw
	6tvqgMfF5X7V0mv1ZICPVaUXiCgGwuEMwNxpFspTiGIUUcjYsQOt43oDEZK0TH5mru/D5eFTnmQ
	qugMCFQotks2mubuOsaBRAthc1qSSuMjfobDRg3CKFtXK4nXDFPirT66/LfW1NkmlK6OxCODruI
	HYt5Q0dYEL9poAuzPf3DIHX9CcTYOmqXxx38oNyqniHKbWXDxbuGEind+RiL6BstcuUFox+x5fP
	NWGpPKosOZpjWTL+H366H6dWZDBylgdhVmnzvXks3oTK/ch6pqyG5q8vJPEArgrFNn3TPypc2rD
	siy7/8wsdjfX1AQyNmOF+CqCmxWtnwTRuPVEMUcJs19RQAAzCXLoX/FmjcroNW0mzoLPcaFvUs+
	w+J1SAd2cPzjeVrzzNMzzUXVg87XVvDefjqIqEW3HEW6bMIQm06adw2fsP2vE4rjgAH/OXSgF+2
	cX7tlMRsTE3p0vaL0M38/P4xh4aR5JoP
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr24239538a91.5.1795797634227;
        Fri, 27 Nov 2026 08:40:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6d00:8302:1937:74ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm38838830a91.4.2026.11.27.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:40:33 -0800 (PST)
Date: Fri, 27 Nov 2026 10:40:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 00/10] remoteproc: Assorted bug fixes across remoteproc
 core and drivers
Message-ID: <awmyfo4HYoQ2dqKT@p14s>
References: <20261123172140.3547896-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_084042_733603_FCF21CEE 
X-CRM114-Status: GOOD (  14.36  )
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
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Mark Grosen <mgrosen@ti.com>, Hari Nagalla <hnagalla@ti.com>, "Rob Herring \(Arm\)" <robh@kernel.org>, Guzman Lugo <fernando.lugo@ti.com>, Uday Khare <udaykhare77@gmail.com>, Clement Leger <cleger@kalray.eu>, Oleksij Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Ohad Ben-Cohen <ohad@wizery.com>, HyeongJun An <sammiee5311@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, linux-arm-msm@vger.kernel.org, De Leon <x0095078@ti.com>, Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, Siddharth Gupta <sidgup@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Hari Kanigeri <h-kanigeri2@ti.com>, Alex Elder <elder@kernel.org>, Robert Tivy <rtivy@ti.com>, Loic Pallardy <loic.pallardy@st.com>, Brian Swetland <swetland@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Sjur =?iso-8859-1?Q?Br=E6ndeland?= <sjur.brandeland@stericsson.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Mon, Nov 23, 2026 at 05:20:44PM +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> None of these changes have been tested on physical hardware.
> 
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: "Sjur Brændeland" <sjur.brandeland@stericsson.com>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Beleswar Padhi <b-padhi@ti.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Brian Swetland <swetland@google.com>
> Cc: Clement Leger <cleger@kalray.eu>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: De Leon <x0095078@ti.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Guzman Lugo <fernando.lugo@ti.com>
> Cc: Hari Kanigeri <h-kanigeri2@ti.com>
> Cc: Hari Nagalla <hnagalla@ti.com>
> Cc: HyeongJun An <sammiee5311@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: Iuliana Prodan <iuliana.prodan@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Loic Pallardy <loic.pallardy@st.com>
> Cc: Mark Grosen <mgrosen@ti.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Cc: Robert Tivy <rtivy@ti.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: Siddharth Gupta <sidgup@codeaurora.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Uday Khare <udaykhare77@gmail.com>
> 
> Lee Jones (10):
>   remoteproc: core: Fix integer overflow in rproc_check_carveout_da()
>   remoteproc: k3: Fix integer overflow in k3_rproc_da_to_va()
>   remoteproc: omap: Fix integer overflow in omap_rproc_da_to_va()
>   remoteproc: elf_loader: Fix overflow in rproc_elf_load_segments()
>   remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
>   remoteproc: imx_rproc: Register SCU cleanup after resource acquisition
>   remoteproc: qcom: Clear glink->node on allocation failure
>   remoteproc: qcom: Skip unregistering uninitialised SSR subdevice
>   remoteproc: imx_dsp_rproc: Fix pointer stride in
>     imx_dsp_rproc_memset()
>   remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes
>

Other than patches 7 and 8 that will be handled by Bjorn, I have applied this
set.

Thanks,
Mathieu
 
>  drivers/remoteproc/imx_dsp_rproc.c         | 10 ++++---
>  drivers/remoteproc/imx_rproc.c             | 33 ++++++++++++++--------
>  drivers/remoteproc/omap_remoteproc.c       | 11 +++++---
>  drivers/remoteproc/qcom_common.c           |  5 ++++
>  drivers/remoteproc/remoteproc_core.c       |  7 ++---
>  drivers/remoteproc/remoteproc_elf_loader.c |  6 ++--
>  drivers/remoteproc/ti_k3_common.c          | 27 +++++++++++-------
>  7 files changed, 61 insertions(+), 38 deletions(-)
> 
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 

