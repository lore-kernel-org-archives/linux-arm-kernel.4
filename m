Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441F6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=14FOQIdn;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=aKtzsSx4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yRL3JyiAib4oTHNTDKyWbrLU/IIxfk4M2prFXzJ16C4=; b=14FOQIdn7C77wL
	RJ+br2wgjh4Ha/a+uVYk8tf9Qqui8FfGCV/R3qtUCuvxDngBGXEt7xr6vHfEAZ5I+2VLJtLxHex/9
	AwnebpdZvXk0HkpjLn8Aj0w7TRCA8s3zen5rb0T802fmbAp4MObz8HjVcRHrboCZbFK4lyRUakTaq
	AhOsqbdFc9yH1ZBInBZ2kdPynVZQrk9fAN2oR9EAj+9jF8554o3qLHhefboP1RpsO2dbe0hg+9ctU
	5sTsacepntcH8uNnj6XtKn4ScpQ1lgSsKBJG9rHLfWcM33w8ExSzh0Aq2TWo6X4B/Lrr6h0ERQcZ/
	w2yIE32SeUoFPapdwYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUja9-0000000H7xK-2pCO;
	Sat, 21 Nov 2026 11:48:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUja6-0000000H7wd-1EUU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:48:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso302087666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 03:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261712; x=1795866512; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRL3JyiAib4oTHNTDKyWbrLU/IIxfk4M2prFXzJ16C4=;
        b=aKtzsSx4dTRXpjGZTJJIq1aUSW/RI8yr3GzKZJ3GnNdl1FFmSOZW0bmzFKo4u5QCUw
         0j64Uc0bkv/gnq8qEieSXzUz8nUJ/zsozJtgcXJBO6qcAqsIha3iRjWEAtM8wnpq+QNI
         +j0LrN21PZlpu70d4+NJj5/0VrfRPTywjbbnPKOLJmRpykSBPYIS6pHanOhxeeF4OGMQ
         CBDtiqZDYJ54iwxg+ZwVWeoptDznVY1mLphNiQaMFlOD/3sjEBgQ5mzG9dellrXsLt4/
         jv3jFrSOKvycq5EIczSufG+FGALaHy5pMI8yfNg2zIJVazadQJW/XZzNnoparGGkBKvm
         DCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261712; x=1795866512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRL3JyiAib4oTHNTDKyWbrLU/IIxfk4M2prFXzJ16C4=;
        b=CkyBol8Ur/hDlbKmYZy6I7L5jvNwceYgWvcO4vU84/xVUyv3xZOLaxdak/VcTQC38R
         spCiGBuU7/ZnE9taIXlHyNQlH50H1BVLncXIQppRaqKUzIyGqAO13r6lpk6RKkii0ABK
         IfIKx9DxhZl3GAWV0ZJA31/chrhtGlLtlDRXfcULHwE793nBAfc5t3nJiX6cjIFZ82OH
         y3cGfbbpPsLkGdVlD6QaavLS3YyWmzbJkPdgLfbQfXCZsmBXe105TpdET7mv0AxNfvYz
         K1I8paod4qA6tzMIl8ce0RSEdbgz7blGH+oSzvSujXZgY8i9uerKfdYbataT5ihp8HnO
         NlyA==
X-Forwarded-Encrypted: i=1; AL+hErGmmQV+cVJPkNx73Dp+Lhu/3u87vcpAWebG7zncrLwjnOPsbIuPLUxmTTMz3rTXIAV7xh1e+Z2sv66lRHgXydx2@lists.infradead.org
X-Gm-Message-State: APuU4Z8KG50vbWTuAE1IfGQeZHUK7ln2P2LCUSkoaMx9aK0tbM5ztWV5
	TrJr4q5jSjQZEsJCuDs55NS3dSqT7/s8TJhrPB1v/+zIJYX2AvsJljEo7yWPYvrjIA==
X-Gm-Gg: AZFdTZdKfaxDcV60ILdjBv5VGXuSawOarYbWQFRa5fx6oMpJ4LSdWqc9OlNyYpJ0dx4
	rGwjhByw6cEKjBXi3CT+w+7UKrlaZU1R5Kl7DGzTAvIiGVjSrzdqVlB3DfOwcIdiZPx/NbydnRc
	JgAJK5M0BepVacF4mscH+oQSCrVQ9wKlSOE9ome+n+W5qqc5GMnWsBFoz1a1pBxf0ZeVQXuhUJ/
	kGllrLZKaCOh3dNSawhFukd536FdchUf/c7MWKjv571Z7rJdTDLTemDoNoIcT5gK/JexWfkZiIO
	K67GTXxwhvtPQT1kTvDP7ipofmaEbt6CIutYIJ7TdD+ApwS/XCkT56SVQ0OjMa5G6lHLGB+aJoy
	ETNlQGv1GrJfaoncnLB0fGgxHAuYY8/aaHQoLGAymMc8Zg0PGDEa5ufiAIenDR6w7m0wnDwn99E
	5lbFiXqToSYI6U8kv3dEIRJfE0p6sHpfh3TV31p/jwYwvi5JZjToi0wUjq+KJ3BLKkSKXbu7/Nd
	PVL7Q/Kjo0JA+obNj30vSUNP8aP9HocKLJ5vRg2lzC1gTHi4hfttQOlbB7KxEOKujepGDya7z+b
	1w/Ab+mwhevBNrrtVrluVWVSxAZNm9I23ZhJQ4zN/jISjkSGlXsU1hI2vQCQa2L6Gr1N7E/0WR0
	jxWZlSjHgyU7Wv20EkgP5cUxmHCsr2UTvr26aHO6aI9sSBi5FlECWCzLRSog9w0yeyHmn26PeOe
	U3
X-Received: by 2002:a17:906:eb15:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c513a5ed086mr409503766b.11.1795261712641;
        Sat, 21 Nov 2026 03:48:32 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afecbb5sm193756466b.71.2026.11.21.03.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:48:32 -0800 (PST)
Message-ID: <139cd117-9a75-4304-9e3d-94c47476443e@pardini.net>
Date: Sat, 21 Nov 2026 12:48:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: Cache out-of-band hotplug events
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_034834_373263_A6D2276D 
X-CRM114-Status: UNSURE (   7.21  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/08/2026 16:55, Sebastian Reichel wrote:
> When the USB-C state machine finished negotiating DP AltMode before the
> DRM device has been probed, the out-of-band hotplug events fired to
> early and are lost. Without replugging the display or reloading the
> USB-C driver, the DRM driver assumes nothing is plugged.
[...]

Thanks for this! Tested on a Mekotronics R58X-Pro (RK3588,
FUSB302) on v7.4-rc3 with dw-dp v12 and usbdp part3 v18.

With an Apple USB-C Digital AV Multiport adapter (A2119) plugged in at
boot, HPD arrives about 2s before dw-dp binds. Without this patch DP
stays disconnected until a replug; with it the display comes up at
boot.

Note: I used the rebased copy from your rockchip-devel branch, since v1
no longer applies after the drm_utils.h rename.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo


