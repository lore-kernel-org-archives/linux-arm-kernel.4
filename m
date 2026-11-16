Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ED3606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4s5C/OST;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rQfquPVd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fe53qh7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=; b=4s5C/OST0EQ3JNxa2YCAsM83wR
	l7/hg7M0i0bWwtAuVeTVKIXOkIIc3YKrTBDKU4Cb2lSNBAcI93zfXof230ofCZyuuOKt6rkLqpTXQ
	Xo+wlZ5Km/3ek1siiqgdzOwOlc5y6zQPtaOnWZgNWRuDlHCX188LKj8Aez3vFUyDT1jCNbwumFIJv
	GdjzlPsvlVRQe6wPeN/UgQ8nmss39yNOP8hhJG2x0SI03nw+sl/VdlcsE9ymKE//fITV3JmgCapwO
	+oe7ykucXuW4H6fBUjGl8Aw++RFAoAcS+3GQJIx6SseoYiYZuzsXSMDcDB02CS90JzE8ozStI5Ml1
	FLV7742A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStNA-00000001qHT-1HQq;
	Mon, 16 Nov 2026 09:51:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStN9-00000001qGf-0HIi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 09:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=; b=rQfquPVdHY42ana7hnvpkscdI7
	/xCTWJ4LZ0OBSDkIhVlZ3K2LV2zU238a0H1f3S7TSNafVudYNrCqbxJe6wWN1z+EDHFRSPmP/7NBo
	DMDbP/kvacy5a/GHIS1Nb1GO4p33Zy19K35c9kUWTguQkRZbkUbhEoDUrK7v+6G2tDZ+vPE7RiVFi
	YwPk/knrCRvLtPJbrEU0DFR1RrNap5uRGYTlgKLRkW3f/qLVOwJI5LyFU6RQam7J/dLk9GPxeiumA
	ZbwMACCO6yWD8FFJzdfSqV21z5AINa2YbYy2LW9yqdNu3ZaKa1dCjynfgDzfbmFqqfGLc8FXkvQe+
	BmKDfI6w==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStN2-0000000DaUn-0HC6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:51:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-49318428d98so1275763f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822684; x=1795427484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
        b=Fe53qh7y79/eVsm5sBIfHc/i3ACoQv16SvcGMdhshORZd01miYsVh2YIVXcFVJHuST
         Yq043s0gXnsQFlx262McerH78CQukMTYImxUe7WyPC1eRm5jIaBalFcyrJeaD61lDmbk
         q88VUO8Aiy72E8YBlxwRQRAzatwBe3rpM+GFQmJMNjehiW/wviGj6ICxjIGviy+d3VzN
         f/wV7h8AKHfxlvHEvnnWrNUyyPM5S9caoOtMJLs7nBDCfo8e2ucLfJd7Obbffe6KEBdw
         XiiFfXR9LFg/ij1/s7hQo2wuv5lKTNUSflpiAfRJikP36+oxzdB7WbfptONBF1vbz3rs
         GMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822684; x=1795427484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
        b=LfpbaIFEMRy8qzIEXpuNLiYA3Bd9U/zNIRurgzOvzKyYdLtbqSccIrQ8v3CRmXe/BW
         dXqZcNw5HQ69rGFpWDwPmmT+Qfh8hqx+ar/8n79bOKn9g0cxUhNDG36d9HJZjKjCiI3V
         HzKf9CIztefrlyX6zhBEpcgZT178UA7FmZaCzEckbC2YQwm8flZ+iQrk+C0cnA58BG6T
         MZZI/Vykl/HDilBthquMhHSOQ64YVsw8IQeYqAxQNKR7K6ft31+wazLcscJrVOLlAWY2
         nsWNCmtpB5CAA3mg9IHh0gIkmKjYS/hJeUeF8AwdEuVtRokXOqxxNRCmcrXrqe8Nk6wP
         SKHA==
X-Forwarded-Encrypted: i=1; AL+hErEOxZE4+omaT4hl8RlkCJMYUOa8IEwIa7q/IgmOD+jZeDjCaa4Lvq5I+YgkENZPfhjwEPPagBszDwNO+VptMtUg@lists.infradead.org
X-Gm-Message-State: APuU4Z+xriDOI/89EAkBHwJ9Trrj4zJVOStCNTPXHgS+QPO0x2kKkjWb
	0nUeDnWWgNgfupPUQ9paEe1LeotEaNpxnOpWB4BIl5CTvQUJqXeW2jAx
X-Gm-Gg: AZFdTZd3VMSDWXBVXrVkrljrwvpGL8BzY8rZa9YL2etmC5ZLvNEGysaZxW6NHSa68cL
	Lgg8z0JII+YlB7HKBgwF2JzQt4zMwfTecP7XTxjEJ1olFYs1F2sDw+yh142WZsak5+qfOcSJ+rA
	jocmCDdviyq07h0BsjIzSgUV/Glp68kErHXyOrl4kb/xkT38vBvI6EXvF87680TQklGJq/nyV2d
	OcopbneJ9CcfAm1Y0ib/GWjU8bzTJ+RYGYMQViusEjPjgT+uSYOWoXxgZLZOpr44PcfifIDbHTY
	GHqBQJk6OL9OzdcBQ/2FmNoltF6EQxb2gkO+WS31jo0m3p9lVI+JwaEt0hbq88thBxm7THtoVej
	LUgGZpg3+Pmk8NtsfD4xTW3hGMQJ86KDv5NayC/0jY9vmKmWwbE+AyyfUcFPvhmg864S8ZBohAC
	7Epavd7XLBGBts6vzpiQl5b9pz4er3LZWPx9SWvuMGJksKqYrgzEtKEDHSEDQjdVS9W52kFYb/q
	u/AZVsaX0zayCkuk+pmDIY+xnBo5BhMqgVtI4kRwjwNDlydUduSPOMob5KMDxbfFgqKyonC2vCf
	gLlxiho=
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id ffacd0b85a97d-49da38ab522mr16399232f8f.27.1794822683448;
        Mon, 16 Nov 2026 01:51:23 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm21517792f8f.10.2026.11.16.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:51:22 -0800 (PST)
Date: Mon, 16 Nov 2026 10:51:21 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: test the block read flag of the message that
 is read
Message-ID: <avrSGehp4JX4aQ5L@eichest-laptop>
References: <20261113110501.1142036-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113110501.1142036-1-mehmet.fide@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_095128_691768_E6938E0F 
X-CRM114-Status: GOOD (  28.35  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mehmet,

On Fri, Nov 13, 2026 at 12:05:01PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> i2c_imx_xfer_common() decides between the DMA and the interrupt driven
> read with I2C_M_RECV_LEN of the first message of the transfer instead of
> the message at hand. A block read of DMA_THRESHOLD bytes or more that
> follows another message is therefore done with DMA, which reads the
> initial length and does not look at the count byte.
> 
> Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> Reported by the Sashiko review of another i2c-imx patch:
> https://sashiko.dev/#/bug/linux-f62df5ed-ad96-43f2-872a-ae2c0100b73f
> 
> Tested on a Colibri VF50 (i2c0 with DMA) with a v6.12.117 kernel that
> carries the i2c-imx changes of v6.13 and later as backports; on this
> base compile tested only. An I2C_RDWR transfer of a one byte write
> followed by a read with I2C_M_RECV_LEN and an initial length of 16:
> without the patch 16 bytes are read and the count byte is taken as data,
> with it the count byte is evaluated (here -EPROTO, the device answers
> with 0x25).
> 
> The line is from v6.13, the patch applies to 6.18.y and 7.3.y.
> 
>  drivers/i2c/busses/i2c-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..9abe0a26c877 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1713,7 +1713,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			msgs[i].flags & I2C_M_DMA_SAFE &&
>  			!(msgs[i].flags & I2C_M_NOSTART);
>  		if (msgs[i].flags & I2C_M_RD) {
> -			int block_data = msgs->flags & I2C_M_RECV_LEN;
> +			int block_data = msgs[i].flags & I2C_M_RECV_LEN;
>  
>  			if (atomic)
>  				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Thanks a lot for the fix, it makes sense to me.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

