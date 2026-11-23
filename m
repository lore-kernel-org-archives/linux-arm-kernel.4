Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43937606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4raBxsl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htrT8TXc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=; b=Z4raBxslCiv2mFtyB+RuZxz1/t
	dusjEPbOcq4taYhL9RLeED0CMikx6y66Z4iDxYMMN/CO89FUAWbub50KZCCrxYORE6/G9N0ltPAOq
	Tym4S9rAyQ/6OqQSGBLM2TKmvVR0EG0Z1tJlmfP/8HnUNlB2fVLqBPgQ4zwZ/7TkRpDoK/Ky0Ih/O
	Znb27SbAgC37gADvbR/GeSajBIwPwVppHjcqYeSk1dQajYPlO5/SLXRPAjnif9/v3Dut7rV3YW9cu
	XyEJrgy6k6Fbk7lZEM5Szu88E5CzTD/z1UCYRxlMLCm8yZdZtqMT3EaGN9RlPEs90wEkR3N5RNg4L
	Jh7SHHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdPC-00000005A5s-1ApK;
	Mon, 23 Nov 2026 23:25:02 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdP9-00000005A4l-2Hvg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:25:00 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1b3ada81853so4469448c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795476299; x=1796081099; darn=lists.infradead.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=;
        b=htrT8TXc+RbqH4+5HMQjlgQiRU/aPRUERBRpsfaUeNxpzzjohJa6QEzmu3807pxw2m
         JZrNDvTB7gfk4V7N7L2fNZoXTgvRi/V9o2TifdUQsh7ofhatqUZR5NLsqwkzJuZwkvL6
         ys2bgYLM7tzTYWsfmZOL0kZTFnUxdGst+cUqSWIsNU7Xf9bivv8C7+8O1Nl3FG1nZQ3b
         x/uXSZNJjeMz2FgmEz8vVdCt8grFuxlzKFaiQWfjB7t4YVYVQ8DUdC778wjuwJHUxKTN
         IlxpQiq8SaFpt9bJi6NguZDukNvHwZg5U1Y9CLWxlNCa3qLtzVt22tDdf3GTC/x98Wlx
         tniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476299; x=1796081099;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=;
        b=GBFoh8b6mL9uGZIxj+puJ5VoAkcvrc6vQG2IC09kmdkhtBDLavTL8w4FPBQmw1cZwL
         iatiyjsbB+ElgXLpA3xK6BAlJXhBKiEMlUnvnCnhyI38jvBMCy6g2ZsG6n3vEk2nq11k
         +yneKnj0v2CNXCGAzlUmUOqtBCr5UoaxSVDXxzjpoPj8aFwxhtdb2JOFN85sjJLIYfIo
         dfZVzarT097p1sv5OUwFZz0pqx8sEiivQJBHMYEqbxv5Absggu8viRPecSEzxPwy3N+E
         7W+l9M0AX+4PvckVCffAweDCztOgwlZYGQwGaakfeMpq+Y/lwuLGrDiTbb7XJ8jqU0Qx
         ydYw==
X-Forwarded-Encrypted: i=1; AL+hErENx+yqf4TjBF43uJ7QcQTcDvg5r6FX+VXJhKSPk6PvUJOiNo4m5EvMOR6fv4ivUBMlPLm4Pk8nRaTYO+ibe+Vl@lists.infradead.org
X-Gm-Message-State: APuU4Z+2W3yM1ZA5wmVy9iRCKrVpW6pjcrvG0+oPrQ6TFIsQDaKlaORr
	rN0n2GkFRKf4U5PY3uRJCGNG61qZs3UAUZ+y2uYp7essOggS3VZ+u+XE
X-Gm-Gg: AZFdTZcPbEgfBLz1gAVeJgyojvUMup0ycvOWZ6A7HHuTriW/fjenE/o3Qh0tL284zZY
	79sOn9QLPEVkXZh18u3sTMOUDcrcTiygBEQrR4x9zuDPN1IBEI1vH8DzmL82dmeFzu86NRHKgVu
	3+XieGtDiDs2ZYjfqaB/U3E3zSZbeas3swlmCbML4iCfM1I8rU5vyFZ8cTJ49eaaOauY42q0lD0
	4dQ0Dsmaa9n8HpyvVr2tGc0++cUsVpx9q8nrWHgzTjjNeSHrWzd4/T+Wm4b91r1h0tgVucqc1kM
	66BcX4OUguC3veikXfOuN9ggbiGUWFBAN9wNmNkVQW/u4gPYOnbs5oSqZWb1pPJGWoT3Ul/RHuZ
	b2xmENc6fe1QFax3QKAfFDJbZ98YVZkD6XYKsqnmJspEH7QePymm+YVgBGV3EwGz5423CR1noEP
	yxDfuZxLpkNU0LWWJqWJojFTpgKpodzbSJupqNmEyL8Scz88pmie9S6TteZRh7u7f7r2nniZQwv
	hfBeN+IWMZN5zv1Y4KYFcsnh9xJ9eK0RVkjSrnaO1R/6mL6vyPNKhUDdpAcF/l4/GkR+LrCxjbp
	ZULFOCzs3QHqUivE+tRRE5Rk+V1zPz2Bd+V13Srmg2DaeafaMn0yFms9PxzAY34GB0nYeVWIxsz
	Hn9/eOx7MwmBXNVA=
X-Received: by 2002:a05:7022:2209:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5568b9e59mr16444195c88.24.1795476298544;
        Mon, 23 Nov 2026 15:24:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm34835125c88.13.2026.11.23.15.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:24:57 -0800 (PST)
Date: Mon, 23 Nov 2026 15:24:56 -0800
Message-ID: <a545ef5377ee473829c3780e94d107e5@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting firmware
In-Reply-To: <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
References: <20261020122712.526797-1-l.scorcia@gmail.com> <avZiZoGO4jXjIP7D@google.com> <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_152459_584968_BD6ECD86 
X-CRM114-Status: GOOD (  22.78  )
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

Hi Luca,

On Mon, Nov 16, 2026 at 07:53:58PM +0100, Luca Leonardo Scorcia wrote:
> > There is call to goodix_int_sync() right after call to
> > goodix_start_firmware(). Is it still needed if we call it here? I think
> > the vendor drivers does not do it.
>
> Hi,
> unfortunately yes, it's needed right there on the Lenovo Tab E7.
> Without it, the REG_SW_WDT right after it fails with the error "Error
> reading 1 bytes from 0x8041: -6".
> The vendor sources for this device [1] show the call to
> goodix_int_sync exactly between the two interactions with the WDT
> register.
>
> Actually, in the same sources I see no trace of a second
> goodix_int_sync after firmware has loaded, so the existing call could
> be moved a little earlier instead of introducing a duplicated new one.
> I tested moving the existing call on my device and it works just as
> fine (basically, my patch + commenting out the existing call at the
> end of goodix_firmware_upload.
>
> Which vendor sources are you using for your reference?

Sorry for not being clear. I was looking at the same vendor driver you
linked to, and I was asking whether the second goodix_int_sync() at the
end of goodix_firmware_upload() was still needed once we call it inside
goodix_start_firmware(), since the vendor driver only does it once.

Since moving the call works on your device, please send a v2 that calls
goodix_int_sync() inside goodix_start_firmware() and removes the second
goodix_int_sync() call at the end of goodix_firmware_upload(). Also,
please change goodix_start_firmware() to take struct goodix_ts_data *ts
directly and use a local "struct i2c_client *client = ts->client;" temp
instead of going through i2c_get_clientdata().

Thanks.

-- 
Dmitry

