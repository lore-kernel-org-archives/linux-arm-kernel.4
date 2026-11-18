Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF7C606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fkjdd1Va;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=DZPLUL18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2tvf2EcWGz18wBidfXOpH3XHWyYitQnho/idJ3+zHjw=; b=fkjdd1ValelCtu
	N1P6yrYo4lIePZle8fzwYLH8BzwSvkPXzhqreIF12R8wzduH7dTE13SElke7TkaFbd96xkoVM8M8e
	oNPdIjNUA+slmZvp1OtxOOH6eQnaIxkqx1m1+od9WGL0gFWnfyaOXk4tbxrzHFbPVFN/3M4vPDLup
	GPUhbfwtobw85PJKoYX32CGEVLjt83gG6n2s1frwVGbU79OQ/uJXfA+LqYtQ5Z0S6fhEEIPCaE2e1
	/IVcHB87h3nUnLfsvZKaoxhi8bKG/VL0vg2YyemJ+0WqDam9IHulSvSzXRKh3BenfvI5BxOzcrASE
	qPRSllujluDg9jEANnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl3X-0000000A5Li-134t;
	Wed, 18 Nov 2026 19:10:55 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl3T-0000000A5K5-25T5;
	Wed, 18 Nov 2026 19:10:53 +0000
Message-ID: <f0c5f3ae-5a37-4f38-bd32-6191a6a98485@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795029044;
	bh=y9UgIWQynPgPoVUM6/yn261u+b/dkSIroE44iaL3T2g=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=DZPLUL186iJM63saUsDmf+QkaMlJDFQ0b3i6Pn4Ivn7rDVbd+CdgMfNGuJ5E61TgN
	 4nqWYMEs0NZYMTWbpqLapborXRKZ7R0tLvAAFshU3+Irce7MP/AlT4f3tisXyihh+g
	 56re9lp/cNYBe2c8rEQimJQQU13wKmVciZzaOq40=
Date: Wed, 18 Nov 2026 20:10:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH 05/10] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys and phy-names
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
 <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Content-Language: en-US
In-Reply-To: <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_111052_090580_2B86FBF6 
X-CRM114-Status: GOOD (  12.83  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 13:34, Neil Armstrong wrote:
> On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> The HDMI TX PHY now has its own binding and driver. Describe the link
>> between the HDMI TX controller and its PHY with a "phys" property
>> holding a single phandle, named "hdmi" through "phy-names", and update
>> the example accordingly.
>>
>> The properties are optional so that existing DT, which do not describe
>> the PHY, keep validating; the driver falls back to creating the PHY
>> itself in that case.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml        |
>> 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-
>> dw-hdmi.yaml b/Documentation/devicetree/bindings/display/
>> amlogic,meson-dw-hdmi.yaml
>> index 416fe263ac92..5a033fec21b0 100644
>> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-
>> hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-
>> hdmi.yaml
>> @@ -108,6 +108,12 @@ properties:
>>       sound-name-prefix: true
>>   +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: hdmi
> 
> I don't think phys-name is necessary here.

Ok, I will drop phy-names and use NULL as name in the driver instead.

> 
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -136,6 +142,8 @@ examples:
>>           power-domains = <&pd_vpu>;
>>           #address-cells = <1>;
>>           #size-cells = <0>;
>> +        phys = <&hdmi_tx_phy>;
>> +        phy-names = "hdmi";
>>             /* VPU VENC Input */
>>           hdmi_tx_venc_port: port@0 {
>>
> 


-- 
Best regards,
Ronald

