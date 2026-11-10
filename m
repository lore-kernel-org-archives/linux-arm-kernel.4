Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KIaHXCeu;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=IpNJj357
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6cr9ziobUF9AnItm9jr9xGM9l0DDOZ1SgmvFxuND5DU=; b=KIaHXCeu3HPx/t
	zHpjE9bhJUEdKOp2Ac3BZz09Apqd9lKdIdxUfr0i7ouEjtUuD7ay+rZ948tOBRzXOP42ftp/Vq4w3
	yrXs6bIGdtCmCBv5E6HGoEz96rsNwOjE9OpdNpDB19sgAajB2+s7vhMpQ2mk0BZhSxKF6WwXGHLpI
	BnVzUcMS/CgnnH/ZeFqITJ8PvaW5ZbRIy87/PBizITH+hvTVQbWw53voEHwZfNxx3kvVhanZf5ZM6
	YjvKHUcj7PQCiULLC7kUyNsv0DSUkA6z6W91FkYqB7k3+LZdeuS3SrN2OsHAOne42LNl11b4GWkAd
	UPb5vV7UAOLS+D5bryxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQahD-000000025Pp-0dli;
	Tue, 10 Nov 2026 01:30:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQah5-000000025OI-0jCN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:30:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1977835a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1794274235; x=1794879035; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cr9ziobUF9AnItm9jr9xGM9l0DDOZ1SgmvFxuND5DU=;
        b=IpNJj357n6YbIqeRxF8M2l9WmlTOwRl4kvjpkTX3MeGlVVZZOWBMEy4vnWlMIH8RB5
         9JBonqzbhviBmVRQqc1YnR5kLEzI5uv5GNFfVcXggtRbk6Ryiyk2fMxSWKh2++sfQ4w7
         GiUg/AVdg+W5VlBbfxm3nXAdGGZCh6imzy6Rc/1zGzGp06pxwF7H9FNh8sAZLVMXy9ws
         rkMKDH4D41/abfnkN31ojiLQ/7iw9VTLKJOe24nP6NIAD704d/qhtOWg6xp0kSmhB1/i
         C3/NDDmL4k0plSCv3+hp5n27jfgZPg6xvPfXxU9SVOwL7H6yweK7DmKTD5BGcaHx/1Lr
         Dx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274235; x=1794879035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cr9ziobUF9AnItm9jr9xGM9l0DDOZ1SgmvFxuND5DU=;
        b=BOtw3nqDAKjhzJg1ACBWrKnJRTUjnFkgmMRmUEfghKZvwjFOy0ZurI2b4CRBdTbKIz
         EtpD7a7PY9Vucn+k/GmOBRT2F5CtlGtJIG0Ylqj8qgWh1Q3c3jTSN8+Ojr3x0jOPGflX
         jRL27QwEPPU7RV6u20qWfW8yIkFqKL9ybQQhK0qJdq3CQxHojnmMih7giV0LR0hqzl/z
         VXK0HDT5qPVRF0lSKX6bPNwOPa9T710dMcMtCcYMlmbH6m7SImFrSyWHFgeST2BsG1mm
         CmAgMCmL2JgvxtaI4VMb3Yuqi/WcmsJGvnKko3MwWie9Lv2OnVWPWEMAz26hRpzWfx0H
         /Elg==
X-Forwarded-Encrypted: i=1; AL+hErE0m4HfL9H7EIq9U0A3ssq8Mm+FVTcA9Qgj/PENjkcZBKfOdd2SXb20MOtoWZLAaByM3DRz4XK20uDRjfhiLfqK@lists.infradead.org
X-Gm-Message-State: APuU4Z+8JFaLDNziHgEs4z32TMJc7Gz/RTNqiCQrod8Sviz7+cLL7zwn
	xlVKVLNF4oicGmGwhsifUw87OnjNquS9WH9XM8zqWOQW2XCptfAnhCU89VaO0UiCC1A1GORO70o
	CwGDDWA==
X-Gm-Gg: AYBFou0eNDFovhXJqcA5dEp9heHbnTfkteDyNPklVZp4UVaI5ftFH/7PL+2ID7zKgGT
	jSsxG1anIj1jDFyXy6O/KfKvU7w7hUTPxmJNVsFadzIIh4kKpaHq86n2n9NShUc1NWn29M5N/39
	bNs2XTnEQ/5YQJ5rdOuhUrAuk16C3radqbp94d6XNhmzNGqBh5QSfIpvOtTmJkW7L89uy4JCP4k
	ZYLdDLOm6qZPGxAi24bGD9SzhLL+JM9ns+85W/y7VvttbdoSIb1OvQzlUk88GHf7x0RTwaohTiR
	jSkFzDcQ3jKjRYCT+JM71BHpwmpxC8qOkhmVmNMBqFKicT1pRif8qbTU3F0BIyErd2EhlkF/Cmm
	Qyk1i92VXjbR4q1ORMuAXEG6oEJLij5HcWl5i8Yv4VI5EKH6MhrMfKuU6c9DcDzHIjdXVhyyS3c
	80tKhnaNh+Q2GRvTUv8Esrp+6+BD7pobSWF2A+krOI955PK1jMDK4iIIUbHI2lOEUHulUEnDueP
	r93JvveVeAjSicOV/zugpsxjTiefONCEBmdrBuj4cBRZfpAb5AG6Bk7RLXH0DesbvY1okLegh7a
	GaTj3BfU3Ndn1tzQSfs97wlDQ5V4CEFnlm3kMkSN44rUDuxw8XxmUle4wBDbf2weqxuNvmYu2/t
	GbVN9aE8e93AgTQS+swrH5G/rowTW9unC5jPlkG16jUWIC/WHAHYjt9At//k7fHa6QAm/2g==
X-Received: by 2002:a17:906:c108:b0:c40:d920:747c with SMTP id a640c23a62f3a-c5048f4046fmr83137966b.7.1794274235103;
        Mon, 09 Nov 2026 17:30:35 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:65ed:a8e1:a329:4b? (2a02-a466-4d7a-0-65ed-a8e1-a329-4b.fixed6.kpn.net. [2a02:a466:4d7a:0:65ed:a8e1:a329:4b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5701a1sm41990066b.21.2026.11.09.17.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:30:34 -0800 (PST)
Message-ID: <f225b5f6-13eb-40d0-a9ca-7efab0e6876c@pardini.net>
Date: Tue, 10 Nov 2026 02:30:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: fix RK3588 SATA pipe_con1
 register offset
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrew Powers-Holmes <aholmes@omnom.net>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>
References: <20261109-rk3588-combphy-sata2-6g-v1-1-e9135c91de6a@pardini.net>
 <avJULe_00cHwMh4X@venus>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <avJULe_00cHwMh4X@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_173039_233290_28AF1097 
X-CRM114-Status: GOOD (  11.80  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebastian,

On 10/11/2026 00:29, Sebastian Reichel wrote:
> The patch is 1:1 from Yifeng Zhao with a better commit message.
> You should keep him as the patch author with his Signed-off-by
> followed by your Signed-off-by. Feel free to also add my R-b tag.

Thanks a lot for the review and for the directions. I've prepared v2
along those lines: Yifeng Zhao as the author with his Signed-off-by,
the BSP sentence (and Link:) dropped, the pcie3x2 link reset grant note 
moved into the commit message, the notes below the fold trimmed, and 
your R-b added.

I'll wait a bit before sending v2, in case anyone else wants to chime
in; Sashiko seems happy about v1.

T-b's from folks with a &sata2 board (Firefly ITX-3588J / Firefly 
ROC-RK3588-RT, from a quick search) would be nice too; the board I found 
it on (Mixtile Blade3) is not yet sent upstream (I'm still fighting its 
2x FUSB302 and PD powering troubles there).

Thanks again,
Ricardo


