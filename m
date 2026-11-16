Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D432D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kJNKO8QM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qAcXBtJM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=; b=kJNKO8QM63GmWcs1M0GuKXOUQ7
	BMgRJxYz+arRCLLEEhBPm5PIh2g3N+OtEEvKHrG1qqRan+YeoUHoOb7uCPLOvp7xTsrOXGgQnW1lJ
	ggpS/IMVgv+cW2oAHnYAcDAuQ74XecNVum9LIkZXoMDmZuOMhuDsUCcAasxAlBieLi3PzcI46vg+i
	D71CfGjai+Var8+xLWT5XoNOxsc3MBir7C5LHqfBaIFD5fc+5wDcLCJsIsFIZr+5cF4JmyeyH1vwz
	jcY+HS95l/t/ylt1WrAZtNOpferIEj12Bg7m6JWNylVKnw9xJwWPXeKBWEJSDxNazHHM3Vs3TiJB4
	HaBSUM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1O8-00000003XiX-19QV;
	Mon, 16 Nov 2026 18:25:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1O5-00000003Xhu-2e96
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:25:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so30062305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853504; x=1795458304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
        b=qAcXBtJMoIv/tf09RrYfpCrCR8SB7SXgY9x+Soz/BCO/ELe8GFgwZRnmEmWUZk49zF
         vK1I7wznkmSJmpeaWFdCTG2jXYyFWmmyZHmID2jxkucK/YvVkM+ffQcrbFqhb+sU2GAL
         jrbp4lxPlqZ6e6kkPxgfoFgXup2DX/emEvKMgfSskGOBpsH2VOtJ3qQJs3vHvK7n7snp
         3lXwIK93d6wfDiqtGa3/KeaZzC9bSuxOuoaRq/FHrV+DLNBwG5wFN7E81heMLjt0Zpm/
         VSiZFaxImhpQ2PgjahZC3cODpPYzcoDGgMbEVEAhHwANGcnaFSJBIEo0PKddkx2CJZ6L
         UtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853504; x=1795458304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
        b=y47w4JTiOKxK4Uc/Ihx/GDm616RGZLqm/IyfPEWrP3UlASNhQwGiccoSBY8nR0xiLB
         33OcAPBgE0MYPtnnAPxCeU/PEIQmsupkh6DZZ9tcH64SfMN7g2xLBRNw3yzEODYc2ZLt
         k3OrTiGkS0B5D4GPTxvZODkgXBA1eZJ/YaBWM+I3IWklEdI4SVAo62DD4a+stJp0937A
         4uWYy9MN5/NGNoo4EwSaSIGAUgByOSXeS649w8PYGjPTf9XdsckDFUtSCv4SADmrHVE3
         OISK8PNt/Rn4pl3nXWOjISeDJJ/hpHgJT1e1ACynVXdUcV/hs7w3F1E6TLo6XqoUCBdg
         QBmA==
X-Forwarded-Encrypted: i=1; AL+hErEB0hBZzi4MUdTGwtOvDqTpmFo+wWn/Ut04MoqWCSYIdSeJ1kS74SMe4PMybG5TkxSpqoKHM72QZVUCPU07swtq@lists.infradead.org
X-Gm-Message-State: APuU4Z/YXDaTEKear3CVx+BT/8YRBOvUD004b9YoOACopIk8NPbiVW+A
	F40lxHWNKzIlMzpagMvZ2IZlRrVkA1DsAdv2sEw2dSzLY/3OlwrepUe/
X-Gm-Gg: AYBFou0o9muOEQoX+p8Ap6IxjxI6eVxlt1o4nSxKciGnh3mFDJwdCAZlvUjNe14MXAj
	a7spZ+yd+3FB/Du3FgOWKOu4zFGSDoYrts0DEvw4rcIgPc/+vDSdLVcOm0AmGV/Ha1pzkd9JMYU
	JtkfHcrLW4UD0zBuvqD3mI8Y/MZBqJ78d3J2EDaQUXvoFP+pDE39gkRaOEA58QjnsJ2Ohr73vkh
	ivX6mA01Ym64ajeK3twzG7uiMA9mfb0OeyQL7HGvoiszDKEZDcxKpMXTthWjQ/B9BrYe3l1mvUq
	TBlKMQfOSOTbiSVFOTFz3W4pQhimap8WCS/B+HBat5ZVO6QysaGTSY82TtsMT3Z9STJTub7YZZ+
	YlR/6y1HlCI6NJZOqbOaEVcpucToL6B8EP0lhABjdr2YVZ99R70THBalUxbwXyxBcdPE7eR01Xt
	3Da1K4fvhVYG/QIzHEOB/bNxoFCHRNOtqL/XAdyhvaJVprN0zg6uuzr25rimq6pUr3cCDN58qwL
	j8TGDKN7VTnczwskKsZp0EmxPeQehgroDJh2w9aQFynbvj1mH5QzoORhHDRJX5GOLvHAjHKD9B5
	CE4v9Mw=
X-Received: by 2002:a05:600c:34cf:b0:4bb:6a2d:b440 with SMTP id 5b1f17b1804b1-4bb6a2db5a1mr110927715e9.2.1794853503457;
        Mon, 16 Nov 2026 10:25:03 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430918sm5161735e9.13.2026.11.16.10.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:25:02 -0800 (PST)
Date: Mon, 16 Nov 2026 19:25:01 +0100
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
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: keep the error of a failed read
Message-ID: <avtKfW6vYmwl6D-s@eichest-laptop>
References: <20261116125940.1368194-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116125940.1368194-1-mehmet.fide@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102505_689110_B49CFFA6 
X-CRM114-Status: GOOD (  24.22  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 01:59:40PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> When the count byte of an SMBus block read is larger than
> I2C_SMBUS_BLOCK_MAX, i2c_imx_isr_read_block_data_len() sets -EPROTO and
> fails the read. The read of I2DR that took the count byte has started
> the reception of one more byte, and its interrupt comes in while the
> state is IMX_I2C_STATE_FAILED. i2c_imx_master_isr() has no case for
> that state, so the default case replaces -EPROTO with -EINVAL.
> 
> Ignore interrupts in IMX_I2C_STATE_FAILED so that the first error is
> returned.
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> 
> Notes:
>     Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
>     "i2c: imx: acknowledge the count byte of an atomic block read" and
>     "i2c: imx: do not acknowledge the last byte of a block read of one
>     byte", with the M41T0 RTC at 0x68. A test-only hook passed the messages
>     that i2c_smbus_xfer_emulated() builds for a block read to the adapter,
>     alone and followed by a one byte read. Register 0x03 (0xae) as count
>     byte: without the patch -EINVAL 40 of 40, and a print in the default
>     case showed state IMX_I2C_STATE_FAILED with -EPROTO each time; with it
>     -EPROTO 100 of 100, as the atomic read returns. Count bytes of 0, 1 and
>     0x13 read the same bytes as before, and the bus works after each
>     failed read.
> 
>  drivers/i2c/busses/i2c-imx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..c7fef98934d4 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1142,6 +1142,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
>  		wake_up(&i2c_imx->queue);
>  		break;
>  
> +	case IMX_I2C_STATE_FAILED:
> +		break;
> +
>  	default:
>  		i2c_imx->i2csr = status;
>  		i2c_imx->state = IMX_I2C_STATE_FAILED;
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Looks good as well, thanks.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

