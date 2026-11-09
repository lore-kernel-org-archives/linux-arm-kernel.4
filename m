Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B1606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ur1tq6uv;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bi/vh8bU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=; b=Ur1tq6uvstQ3zb
	hxh1XUNmTG9E+lytDWaqUIpXEWDZ25frWY3bmrG3KthCPxpx7wzxv6O0dPN9BTCTrZUeXL6sK4+K+
	ZOYK0YhzI6DeqkWSbKLPeW/ZV5pM6Vc2Y1rDW1ZBNBvBoba/tPSqQsPxxEsMxlzFXca+it9mUOTuN
	9tgWJAzWIqSTfIrVNQYE/H5skja+x8iCgdth2fKYAXqncSwDA1hUj5ZFOWQ5Z2CF8pLxPk9FC9niF
	Urx410H531bTs/kzlzYBR6zEPmEf+uWNKek7/ZhUm3JSxK1PVW7MxlphTNs0ybkmVMOfwJMs+85j1
	XZEXmn0Iuh1KHHWuUy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNCh-00000000UMm-2vSz;
	Mon, 09 Nov 2026 11:06:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNCf-00000000ULH-1siq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:06:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so7204675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794222379; x=1794827179; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=bi/vh8bU3SO+Iu++96KNXACTx49lDRq/xhDBqW+xckCXlRxo3bwwCR+HGFjSaWm84w
         6sJdvjJC8/LMWe6GBgzoAtUFMHDrw0rY0CxKLtTVu23J5pIlgDWFaZxeNQ65ukMUqYa+
         bIRVMsjMxgMQJElg5GY9maCza24WOBJABq7WHCZaxtSH84DQe+8vaGlGSutOBsrbsn2f
         ipu5lASl18mVwDMewk9vT6jWVbhGv3W0obFl8V//X1PxgM3Q3+FoiDTVaSaIU9ZPKJpi
         XELRcHfaD8NKfFZSNW0aiOqL0bslM81PlvScFuN7aVzX/JjA97Ashq3AR+OV/+O4h3Bu
         Zy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222379; x=1794827179;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=jSySmgYnfCD60dJbkPfYestW5avLQ7+0Vn4gViWU2TTL5q8K+j8F73xRPlC+pcCRqd
         WWAr8z5CcTe44cJltUU64wNWFK3XiWvMN54MCG3vzPXYBCMJft7B2pDn//HnwEDWhIRw
         kdJ0/B6AoER5YkPm0Lu0PDSOTEmrIrRKrCndoQ7Trfth1PjP5ADEKk6TKIfA7NJTlB9P
         oki2XECSH7twJ19JBI9qM8s1uO9zmaPwEE4poZwMA0UytSO8QXSQKjLKMyuhCDEXL9NC
         xe3j8hbi1Yhixzr9cUT1A2cJ9YAOwGSuXv8aBsIWGkJNROQ72qafrlVtsTr/kWWuIbFz
         1UEQ==
X-Forwarded-Encrypted: i=1; AL+hErHLGGaADeNGWawbPcaBM6ISBdF3R+t9Km1SjlIT2n8kSTpiCu4DsgNIb77qxFlujykGaiK5EuuMicNMKvceiqKP@lists.infradead.org
X-Gm-Message-State: APuU4Z9KRROU8pQXan31V0ldn2R0cOy+I4FJ6N5wfRIjFrMuuHH1c+Bz
	MUdDK+yu7+fOs2Cr//l5jsRozg0zpHLhNaQ9PflPQ8kNDBhaJa2PgczqyB5e4TYKp5A=
X-Gm-Gg: AYBFou3ZIdLdrI9AxQjH9JWuJkFzfvIZ0vGprWRC1taGLc3u+/HzyW8HdRofr4Yda2Y
	3KqORqYMg7JjdBH7RQqk/IQD1coBT5zGquNweYjSkPntrm8bmLVPYtLISz97os7II/XiswLgt7n
	dlTplckt6VtmMzVxLpcKoJ6SnbhbU6JC/J+2j7E7Oqnh6cjqEbrb7U679ByV6Cmt9z6LVJIZfAQ
	1/0ntLPpK9+BvvpIQh0n+5r5F5oQwKQ7AEY53RBQ/dQutjSl5Up6i/TEl9N3TbquOH0TUnv3P5C
	5D2L4Rda6+7cUJs5ksFUFLV5nFu5IO7fRGcoPV42r+TWOq5GUY/NXSII7/59pkwVww6aCQOyeqn
	j+j6ONde0S56scqgMnr4GfTCeJqa4Z3L1WMzRvuJjpXMAoW2MHUPLeZv1vP+cYjsdIqNjcG4XTQ
	7ymVYpE15eTviqDLJkQFH9WbxdI3rxoIMvxhrbnOtddnzmAHg3TfOp4Je+T1Xi+vOjjuNvfsIqx
	QdeZ1OrSyFDOEJICqleZiNIR7j91YHz1G6vFVRVysYbdDDfQNChbw9XCANNdGCksxCY3f4fouSF
	OT/qjZKXfIT/cvRloLpmw8aREdSndgAWI3V/hsP68ss=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b963c87ffdmr68091205e9.19.1794222379267;
        Mon, 09 Nov 2026 03:06:19 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm239723095e9.5.2026.11.09.03.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:06:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
Subject: Re: [PATCH v3 0/2] Add initial device tree support for the Xiaomi
 Mi Box 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Message-Id: <179422237792.1514386.10691096283154842282.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:06:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030621_522833_023C565D 
X-CRM114-Status: GOOD (  15.35  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, 03 Sep 2026 18:18:44 +0800, YuChia-Kan wrote:
> The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, power LED, audio, Mali GPU and the Amlogic video decoder.
> 
> Bluetooth is currently not described in the device tree. The device firmware uses the H4 UART protocol, while the current mainline RTL8723DS Bluetooth support expects H5.
> 
> Tested:
> 
> * SMP (4 CPU cores)
> * 2 GiB RAM
> * eMMC
> * RTL8723DS Wi-Fi
> * HDMI output
> * HDMI CEC
> * USB 2.0 host
> * Power LED
> * Mali GPU
> * Amlogic VDEC
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      https://git.kernel.org/amlogic/c/3e965cc7f86b7358a850b191605db72a09450f81
[2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
      https://git.kernel.org/amlogic/c/36f28822232ae35d36ccd2587e333db1ac961ff7

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


