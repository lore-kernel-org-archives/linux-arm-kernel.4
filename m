Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA32606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iJ4pPv7G;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdPAT8Kb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=; b=iJ4pPv7GpYDTurG/UkQOLckMJQ
	FCK3sAePRmyU4aw0GagXtvtrb/HaYWdW5VcC5XJHgQ1ykBLgE0ySNS8autBtkLLyMnSrm3lJ/RIxO
	w+K/ruqYXKuI6ZKdi8yDy8jNE3wA1+m1lRifEaI9/72CZQ+o/HRdlEtJGmwjyJIjubc1ZC8U7aWRn
	ZI5Md0I71cVZtSAOFKBwBYqMR3YpQ7tFY+cQfSA7ZZkQwBSVIQObjRhiuW2k0ey4zXCVwVTlOI5he
	KDVDX+PLCXGmpyhsDPwxM4rHVtIDZCgUwOIZRAXZmPIT/1/praOxhwUUmE+0/B8UUOnYAbdHdm/QO
	7+eCx0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRg88-0000000BRH3-0vvP;
	Fri, 13 Nov 2026 01:31:04 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRg85-0000000BRFd-0PPh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 01:31:03 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso398267c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 17:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533460; x=1795138260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=;
        b=WdPAT8KbbFE2+FujmJWNdP6gjW5QMzA4lmV5RaqLkm3fGd+Nda5Awvvdw88y29rBRR
         Iw68N+4Rbkn4fQI8MoT17H5htNwzMhYqRqS8FVTvmXLTJbv8YhGoZW12k++Ez6apy2tU
         aZFreVTTQ2ul7qwZIwLgaAQQEEiOiuSC7z6wydbhROTSH3AS5ktAstgnuGX4gPuJsjeB
         P1NQ1qyIezy3eVU8Nx1rYbSJH8oVlV05oFVhy75Xrvu2ulap9MLK2pAqOmKrUAao8MIE
         S6B89nLo1LMvICcdDKlHw1jZzqQ/J1+o9PbKqcRH8pOiQVWA4XzCLWUReYYk9huux17U
         yaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533460; x=1795138260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=;
        b=StZaNfp/Zsp+n57GoevLjtOHr/7z7TkDxUYXDPT8gyXK3szRR3Zpuhmq8xrpSIGwrJ
         jCbw6x9I6jRkblQq9jYmfp6TzgkP6Ey7jTMBxqQacHWeVdqHUoZOkf9N5Le+CjE8d9BY
         +HGjcuKj2961S7NSkJSB5Qz9BJDomHlyTk3rGE4IUJczgZ+tpGEz4LTWNsNmjzgRaPyd
         qQxCKBEfF8ZBl+biUQZRrU7nBzYUAk4Pw68ajY8ta/C8rfxialFTtnJ6C9XUJBED3b2+
         Km7/ZGnqDkBhu6G++LeqiIRUFRvrcuJw+lyP1/k319/d9xbTjfdgUGe8vV03OaxxAxy0
         kXSQ==
X-Forwarded-Encrypted: i=1; AL+hErG0xuZwrlIusJOLNSuXSKJHAB4Wu7hB5tddKPmGsJpetLdxK1UrBTpgFsXGUoFyvWQSNMcJcco/B9o6TRTIeGYO@lists.infradead.org
X-Gm-Message-State: APuU4Z+dvyO+btEi+7ptQKAO2nfIrEoHVZMQ1KPCxvTN8Pe+tBB9xMDS
	tSafAcTirW/3SGNQezBGg5MhUpSNxfZcw3gV8ve+1ttl/dZTHKqGoPcG
X-Gm-Gg: AYBFou2icbJQQ0T19Q95ex21UxSN3XVEMQqXnwKL36uBn0X9a5NiHJIQT/4raMd0mh2
	0gESGco/nhErouxiTE0oQgqPr1nF6oV4pjqLW+Rgsi8R9Uml7DdwcWYlrkGDZKD2O8nTbdHKBqO
	/SGaWk5oShfdvEuV7hL7164hoc2vmEL56InRzoVBXFE3oum64BchGtJ6RoWwATR2ZVBX6J4arMS
	gVwFBNomfAAyxF9JhUxu5atpJqV9FOpCdeTzydhC044DByriFPI4nc3H5k73qzjLuJQu/iVtpoD
	bQcysF1nLwIir3eMOaXPRjq+8QcSSO0xfVx8tl2QMHd/W99Wu8ocXOgZpNxvSRspvq4Sxt/mmsg
	I/SQ1AEg9wFbwBqHc61S9zpLCe6cMDqlHnajlNiGPYvj2RChih9L6PK3WquZl61zywyAfDl2iKh
	XHI6APsZG47f9hEuTdlRDQg4lPYFze9QX4jk4X4MUL4DpLZqxI+Cgb3ILbdTYfgB6PZhJ1f6PoG
	OHyQk0YG4ZJvjkLhq+y/ubhkLOlY8ct/YgCu13yfPmasp8Wcuei4UHGV1RE7wXD7d0Z32jL1cPk
	iHSDiWOjx6tlPQ+ueyhhRCHwdNLIbUdimOGi9wUJsrHEOX6JaO/o2f1m2dsjBsNDXEqGjZQ=
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr1313899eec.2.1794533459424;
        Thu, 12 Nov 2026 17:30:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm2333563eec.28.2026.11.12.17.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:30:58 -0800 (PST)
Date: Thu, 12 Nov 2026 17:30:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting
 firmware
Message-ID: <avZiZoGO4jXjIP7D@google.com>
References: <20261020122712.526797-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020122712.526797-1-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_173101_147793_AC2F1A7C 
X-CRM114-Status: GOOD (  24.19  )
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
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luca,

On Tue, Oct 20, 2026 at 02:26:48PM +0200, Luca Leonardo Scorcia wrote:
> On the Lenovo Tab E7 TB-7104F which has a Goodix GT-912F touch screen,
> the touch screen fails to come online after loading firmware, producing
> the error "Error reading 1 bytes from 0x8041: -6".
> 
> Comparing the upstream code with the Android stock sources a call to
> goodix_int_sync is required between the upload of the firmware and the
> watchdog restart. With this change the touchscreen is correctly detected
> and working.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> Relevant bit of the stock source driver at [1].
> 
> Credits for noticing the issue and finding its cause go to matemiller992
> on the postmarketOS forums, I cannot provide tags as he wants to stay
> anonymous.
> 
> [1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529
> 
>  drivers/input/touchscreen/goodix_fwupload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
> index 5ae9a109ba0d..01e7705ef515 100644
> --- a/drivers/input/touchscreen/goodix_fwupload.c
> +++ b/drivers/input/touchscreen/goodix_fwupload.c
> @@ -155,6 +155,7 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
>  
>  static int goodix_start_firmware(struct i2c_client *client)
>  {
> +	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>  	int error;
>  	u8 val;
>  
> @@ -168,6 +169,10 @@ static int goodix_start_firmware(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	error = goodix_int_sync(ts);
> +	if (error)
> +		return error;
> +

There is call to goodix_int_sync() right after call to
goodix_start_firmware(). Is it still needed if we call it here? I think
the vendor drivers does not do it.

>  	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
>  	if (error)
>  		return error;

Thanks.

-- 
Dmitry

