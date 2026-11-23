Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89484606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pJNpt8BM;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eyabE0JU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=; b=pJNpt8BMCdsjpRHj95U9FnBUw/
	eoGQbyZOFs3WWeeYvlJ90rSBtx2+sc/kxvyIAMFVYO0YbStsSCcCEJ+ikCMcXurZ96lA3/jPEaJbC
	cVuzYLY+a0kvKh9jhEwqN6G9TEWEJA8PugYTlzCfvWQHqBAAOLFTZpjyK7HGamTb9PpBQf0KP3A66
	kttM3V0uuiEwz9g3WO1WbZ6RFqxyoeDKo5c1kFNDFrJgVmRBFb1CHOUVCHROTFSZzzYEMcJ9InS3u
	doEO+5kMKZFvYltEaTqfeU0+kkFGnwlk0K7aoEBLKxiW1B61gK69vC2RPrjka5YEtr5u+7iUlll62
	2LstdOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMMt-00000002I08-1LP9;
	Mon, 23 Nov 2026 05:13:31 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMMp-00000002Hzn-37tt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:13:30 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6365496eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 21:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795410805; x=1796015605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=eyabE0JUAt82RfRYn1wQwp6ZvG2Ql+UgdC5In943eRJjdm+0Q231eYt6XJ4HYwAgH8
         v/tr/5UTJ89sJ7yOT7ie96n4PAKYyA1tdalkKgzEHfZy3DlnkNsxjhZXLIqLXKG/dzfM
         LeNsVvQ8hzoX8JHQqI50fxcRI2hwRLSnSt9WxEc1iTCZX9oAgjVBMu9tAybNxhEkp6v9
         CFrPxssKocAFX2k1+2FgZtlCQCb7E27a891WvgN5vNRFmIhN7kCPb6FYVZVVol4dlz8C
         9UGq7v/Kiojh58tFYEnPDciaNcT8pEMEHF9fvISCyjMZZMXOA6ig1cwRnHWfetsc6HEd
         HWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410805; x=1796015605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=CCy5b1T6m0DkbNLbdftGDQQc5mchQx/SNfMiJuibi9Qe7BTy0ckNMJf1eBbKITw/yZ
         IPluSCJB5sTIfNzTr60WG64fhtdQopfeWDT58YYt9yxtFRZ72SqPDAffwm0vuo41bLx2
         WGVONws5O/W/i1P3P7m4HGQLLjNjhnRNCbIY1lqFPY/1egicxRpDHzyBLuTiSUelsk89
         5+zO75DgkHY0glJh2kZSI1fcoOlMLCoCGE+ccP/m0srvIlfsXstp3PfSQ64SgNuvI0Kl
         AEf3cT6k+vqQyvU3oDXUTdkWs1b4VG90Y2SE8Vu7FnbiD6sgpb8DV6GSkjq4XvE9FyVN
         1TlA==
X-Forwarded-Encrypted: i=1; AL+hErF2UCacjrzOdUyl+92KN2n+QlotpjEn5r59bC1DJJqm9uyd4Bv24lyu6m9DNpg+onVy7K7uNOsKu4SHvos+7MfV@lists.infradead.org
X-Gm-Message-State: APuU4Z8uW4MKrPBDac/klvpsghvjxKj1EWXYj4GCJGDGDdRqY9F75CQU
	9PnU1Gn2Fn3RuyQiajEegtlsjISs21ThneqTv1+F1EBa20Dcp/E9M2FB21j6pSCsFnA=
X-Gm-Gg: AZFdTZesMaCPdEfZqapaA7Qf0KhrwlZ+VX37YgBKJRoqA6xA4dpDdwc2tZ8ZI+hCmMg
	112/bhlA2jAMVpcxSBl1z4GU7cpQEyOjWUtxSUYfRgOiTifAUYuYkUCL7/yW/o1CZIH8DMRNveJ
	ogQ4iVAN8kKBFfaVHs97I16js9DYkZ+t8LZLTgVNd7bmpxNe68e16i6IDbahEoG2R1hX1FwG8ht
	bTWsF/vlQjdh/x57zPUnWog8fGrI+J3WaIk05zI0f63g6b6DJO073MEPo2e7jWfDb+Yc4JtWr9s
	oEdCU8Qkf9gswTlxNROU8tiZMcl7AWuk3yyqfYTKzM7In45lVqgADx5OQ3Sp6YtvUY/ckF0gEjp
	jok7D3HIC+xx6rb8vsf96SttEuYHW12weeCw5Ra1zF7jobpdjnbnuNsrteUPo1sZqBUF7Cx9sPA
	ZiQxz1fdmgdo6bQRkZaTjbvJTIIOd4mZUU4D2xUFIdy6NAbYyEF0/E+GwLtsW25TPffQKG5q2NG
	rCFN8gneQxcITR75GC2QALWbAuVq0GGs26oa/tSTrUPWEc6+LSp4IBEH8+sOSfwBuwfkuYhFEB+
	eVLU7vW7YtyyY50CRLU4sdyh/f9VwQ==
X-Received: by 2002:a05:7301:4710:b0:378:314:4042 with SMTP id 5a478bee46e88-385702587c5mr10487392eec.14.1795410782709;
        Sun, 22 Nov 2026 21:13:02 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm28221624eec.13.2026.11.22.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:13:01 -0800 (PST)
Date: Mon, 23 Nov 2026 10:42:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: cpufreq: apple,cluster-cpufreq: Add
 M3 family compatibles
Message-ID: <awPLW-zURwW1dqZX@vireshk-B250M-D3H>
References: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
 <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_211327_796692_76E61733 
X-CRM114-Status: GOOD (  15.63  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22-11-26, 00:18, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
> 
> Add compatible strings for the Apple M3 family cluster cpufreq
> controllers:
> 
> - apple,t8122-cluster-cpufreq (M3)
> - apple,t6030-cluster-cpufreq (M3 Pro)
> - apple,t6031-cluster-cpufreq (M3 Max / M3 Ultra)
> 
> All three are compatible with the M2 (T8112) cluster cpufreq controller
> and fall back to "apple,t8112-cluster-cpufreq".
> 
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> index b51913a81791..516216cb6ad6 100644
> --- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> @@ -36,7 +36,11 @@ properties:
>            - const: apple,s5l8960x-cluster-cpufreq
>        - const: apple,s5l8960x-cluster-cpufreq
>        - items:
> -          - const: apple,t6020-cluster-cpufreq
> +          - enum:
> +              - apple,t6020-cluster-cpufreq
> +              - apple,t6030-cluster-cpufreq
> +              - apple,t6031-cluster-cpufreq
> +              - apple,t8122-cluster-cpufreq
>            - const: apple,t8112-cluster-cpufreq
>  
>    reg:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

