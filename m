Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46D8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ndc2bxZd;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V4+fbZCh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=; b=ndc2bxZdeNkagw
	3K7VKCl6dqVh46tkBJKUPFBVax0aRiMNYMjze8J7EXeXPSO2McGfwr7FA+7l8J0cAHvOnS3GZHgdc
	rFCBNqAA3ngAsEFrDi2nDCyzKu8QSJ1SKe39dFlH8ZbB6FkVvOzOaMHql0G3c01Kbxq5Rc9s0f5W5
	5Zf+d2Gr3IMZHO0DMUkJNka4WwYxGRp+smWGRgYEqvuBn33YPecAQ6w5zy62O5VieYhCE+eKS2zuw
	yPpvUlNS/AIBNJIdjlyzHSqyHSdd0fW5P43wicE1P+YaOcSt3ELt4QnT6oriVt12zmJ7asuotLCdL
	dZLcarwalqvf+gIoEmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmvO-000000064Kd-3PDb;
	Tue, 24 Nov 2026 09:34:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmvJ-000000064J9-0msL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:34:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso31386215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795512887; x=1796117687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
        b=V4+fbZCheX2z5I3W25EK8Er6liSVQUOfH17v0kdzl5bqjbU62qVCr+ymiHv54ZN0yE
         gBBa693XOqmnIW0t0rtIdDDEkMOIi1iW36Tq3sUhmyhoRB90RC9S+szFS8EA9oBtsDwj
         dF0qAgVxhzspJA0bZfgcIQMD9Io+iV6lCztslliu+4qINHNLA5ugkZ/2kdL58AodGMi0
         uiGe4f6zcpSdTqlRA1LmE11izGi/Nw7UJrVqMY0XuHKspRi6sb0T81HqRtReM4bFMfMs
         7uqAhqQCYOXOMp458pwzMxqwp8FI6Ar76/9a+tTJAJx7lkuHze+vnmbHV4y6pwzegXyj
         apAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512887; x=1796117687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
        b=NiV9S/AguCOSujYj5CzpBd9GH8jd8QFsCJqwxWaaL6rm5dwHmmikwKFC3HvgcqXb0i
         I8T9ql2/12IpFihEJ/JwlMt+Wf7W/yuC+CUMgDsvvvk4akmtbIv9rXL5xbEjCTtXzNTV
         sk/iSg24X+00pb0nLQeeG/SJi72I+S0c6mf8HC5JZTteJDEVQJAlebuLgBDw3Ia11hMn
         EtwsWK87oXjY4UNIRNhJu6ElL7oAfAWJ9rnJjNHGQHpYCXqEd8lV6kSNBscbOp2IyUDg
         yHvEPHg0Oi3jIR5AQ1byxrDp9W6mIKrjt5by/Cp4md54J6PDyvS+yS38YyC1c5961Byh
         VMHA==
X-Forwarded-Encrypted: i=1; AL+hErFTlnRRppUgUy9IsGqu0alrqT0yDwrJ46SGSOLAIGGBNXDd3gkGH53KwFHnOgC1ia2sULS3y2pTtSBobGJho0ak@lists.infradead.org
X-Gm-Message-State: APuU4Z+hQGRZ6OTwjpSjR8tpijdYQ/24+uUmZkTef6yK9zv2ytcMlK1G
	mdMdql/kBxsiSNSVJw8SA6G/rp0mgAOVE6YyMIgh6mMEUNe6weAQVJO4uOk54ifLbnBoeyUtE7n
	RV2hOsvc=
X-Gm-Gg: AZFdTZfmoHP1JijmTmnyVHxcIOtlZfHczG6H4smsE3tWhgfv+JDkZ9FZ4kBuPq4+LOp
	7UANwaKK81dm3RHRrqayms2tAZd0Jkv5JyDmF6QJ3BzrVR65eWZofYY7+mLfIW1+R5zOINy2Yv3
	UUk5lDhQCYcY2WFqeK1SoLyYTccDYfFUdEhbKsaCmvj3nu/8ZO0oM531YryWHP9jjYVKEf+Ks7n
	KXQDEY7mtX6/x/hq1EncYv/+jDl7hEYUALI1778lBFjqO7qrokj9k+bDJQqQRi4z6lFfARxPhfm
	ElqfDzmtxGUeLuRfSmpGkg6kbQ6TpXvMx0BJ8L7f4WEvrCC6sc6pTfmxyCObe/Cc6EkAzzLbyTh
	znlA5TyPc0VGPaBXboAv3PDcew01py2jP7K1xgWuXMQh2RlizsmGCGL5tYJ2AsXOnlDA4stTSRz
	1Hs8k5j7PRS5OeddxQvFZzWM1YqnnAXGVYBRekXo9kUP6QDp/5ZBS4/AFQbQ5JvgHdTI0ejuqjN
	KDbhsiVR+ep1ukELE5MvfS8hMd50kI7sI5TW2BIDdZ1mcua1k+WANxGUcj2m+VNpaF45JFoljNC
	SjvXHswRJOPruLN+RdbmBNIcZ0/KMXuLr46LLHDHLMrRwYk/TLkD4k2cDVwbo3HZ/3ccrPuVh/M
	bww==
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb8881e837mr267264845e9.24.1795512886893;
        Tue, 24 Nov 2026 01:34:46 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm26488815f8f.37.2026.11.24.01.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:34:46 -0800 (PST)
Message-ID: <57582334-45ef-421c-a460-314f5b5ece74@baylibre.com>
Date: Tue, 24 Nov 2026 09:34:44 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/8] accel/rocket: take the core clocks and resets
 from the devicetree
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <82329b6681958350294846c830598ebde29b874a.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <82329b6681958350294846c830598ebde29b874a.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_013449_264231_9E02E4D8 
X-CRM114-Status: UNSURE (   8.51  )
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

On 24/11/2026 00:01, Jiaxing Hu wrote:
> The RK3576 NPU core has six clocks and one reset, the RK3588 core four
> clocks and two resets. Take all clocks and resets the core node lists
> instead of naming and counting them per SoC; the binding defines them
> and dtbs_check enforces it. The driver only uses them all together.
> 
> On the RK3588 the resets are now deasserted in devicetree order, srst_a
> then srst_h; before it was the reverse.
> 
> Suggested-by: Daniel Drake <ddrake@baylibre.com>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Daniel Drake <ddrake@baylibre.com>


